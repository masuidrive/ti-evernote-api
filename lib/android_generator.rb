#!/usr/bin/env ruby
require 'thrift_idl_parser'

require 'rubygems'
require 'active_support'
require 'erb'
require 'fileutils'

ERB_PATH = File.join(File.dirname(__FILE__), 'android')

class ConstValueOp
	def titanium(space)
		case type
		when :number
			"NUMDOUBLE(%s)" % value
		
		when :string
			'@"%s"' % value.gsub('"', '\\"')
		
		when :list, :set
			"[NSArray arrayWithObjects: #{value.map{|v| v.titanium(space)}.join(', ')}, nil]"
		
		when :ident
			space.root.consts[value].object.titanium(space)
		
		else
			raise "Unknown #{type}"

		end
	end
end

class ExceptionOp
	attr_accessor :ns, :module_fullname

	def class_name
		"#{@ns}.#{name.split('.').last.sub(/^[a-z]/,&:upcase)}"
	end

	def proxy_class_name
		"#{@module_fullname}#{name.split('.').last.sub(/^[a-z]/,&:upcase)}Proxy"
	end
end

class StructOp
	attr_accessor :ns, :module_fullname

	def class_name
		"#{@ns}.#{name.split('.').last.sub(/^[a-z]/,&:upcase)}"
	end

	def proxy_class_name
		"#{name.split('.').last.sub(/^[a-z]/,&:upcase)}Proxy"
	end
end

class ServiceOp
	attr_accessor :ns, :module_fullname

	def class_name
		"#{@ns}.#{name.sub(/^[a-z]/,&:upcase)}Client"
	end

	def proxy_class_name
		"#{@module_fullname}#{name.sub(/^[a-z]/,&:upcase)}ClientProxy"
	end
end

class FunctionOp
	attr_accessor :ns

	def args
		(self.arguments || []).sort{|a,b| a.id <=> b.id}
	end

	def min_args
		(self.arguments || []).select{|a| !a.value}.length
	end
end

class TypeOp
	attr_reader :struct

	def initialize(category, name)
		super(category, name)
	end

	TypeConverter = Struct.new(:type, :titanium, :java, :fromObject, :toObject)

	JAVA_TYPES = {
		'bool' => TypeConverter.new("int", nil, nil, "%s.toInt()", "new Integer(%s)"),
		'i16' => TypeConverter.new("int", nil, nil, "%s.toInt()", "new Integer(%s)"),
		'i32' => TypeConverter.new("int", nil, nil, "%s.toInt()", "new Integer(%s)"),
		'i64' => TypeConverter.new("long", nil, nil, "%s.toInt()", "new Integer(%s)"),
		'double' => TypeConverter.new("double", nil, nil, "%s.toDouble()", "new Double(%s)"),
		'string' => TypeConverter.new("String"),
		'binary' => TypeConverter.new("TiBlob", "blobFromData(tiContext, %s, \"application/octet-stream\")", "%s.getBytes()"),
		'enum' => TypeConverter.new("int", nil, nil, "%s.toInt()", "new Integer(%s)")
	}

	def types(space=nil)
		result = [self, @type, @key, @object].compact
		result.each{|r| r.parse_ident(space)} if space
		result
	end

	def titanium(space, label)
		parse_ident space
		
		case self.category
		when :primitive
			(JAVA_TYPES[name].titanium || '%s') % label
		
		when :enum
			(JAVA_TYPES['enum'].titanium || '%s') % label
		
		when :list
			return "convertToTitaniumList(#{label})"
		
		when :set
			return "convertToTitaniumList(#{label})"
		
		when :map
			return "convertToTitaniumHash(#{label})"
		
		when :struct
			return "new #{@struct.proxy_class_name}(tiContext, #{label})"
		
		when :typedef
			@typedef.type.titanium(space, label)
		
		when :ident
			raise "Unknow ident #{name}"
		
		else
			raise "Unknow category #{self.category}"
		
		end
	end

	def java_type(space)
		parse_ident space

		case self.category
		when :primitive
			JAVA_TYPES[name].type
		
		when :enum
			JAVA_TYPES['enum'].type
		
		when :list, :set
			"ArrayList<%s>" % type.java_type(space)
		
		when :map
			raise "Map key required string" unless key.java_type(space) == 'String'
			"KrollDict"
		
		when :struct
			@struct.class_name
		
		when :typedef
			@typedef.type.java_type(space)
		
		when :ident
			raise "Unknow ident #{name}"
		
		else
			raise "Unknow category #{self.category}"
		
		end
	end

	def java(space, label)
		parse_ident space

		case self.category
		when :primitive
			(JAVA_TYPES[name].java || '%s') % label
		
		when :enum
			(JAVA_TYPES['enum'].java || '%s') % label
		
		when :list
			return "convertToJavaArray(#{label})"
		
		when :set
			return "convertToJavaSet(#{label})"
		
		when :map
			return "convertToJavaHashMap(#{label})"
		
		when :struct
			"#{label}.object"
		
		when :typedef
			@typedef.type.java(space, label)
		
		when :ident
			raise "Unknow ident #{name}"
		
		else
			raise "Unknow category #{self.category}"
		
		end
	end

	def parse_ident(space)
		return unless category == :ident

		idents = name.split('.', 2)
		tree = idents.count==1 ? space.root : space.name[idents[0]]
		
		if @enum = tree.enums[idents.last]
			self.category = :enum
		elsif @senum = tree.senums[idents.last]
			self.category = :senum
		elsif @typedef = tree.typedefs[idents.last]
			self.category = :typedef
		elsif @struct = tree.structs[idents.last]
			self.category = :struct
		end
	end

	def proxy_class_name
		@struct.proxy_class_name
	end
end


class Space
	attr_accessor :ns, :root, :name

	def initialize
		@ns, @name = '', {}
	end
end


class AndroidGenerator
	attr_accessor :module_fullname

	def initialize(filename=nil)
		@space = Space.new
	end

	def src_path(dir)
		dir + package_name.gsub('.', '/') + '/'
	end

	def package_name
		@package_name ||= @module_fullname.gsub(/[A-Z]/){|s| ".#{s.downcase}"}.sub(/^\./, '')
	end

	def module_name
		@module_name ||= package_name.split('.').last.sub(/^[a-z]/,&:upcase) + "Module"
	end

	def load_idl(file)
		basename = File.basename(file, '.thrift')
		return if @space.name[basename]
		dirname = File.dirname(file)
		
		tree = ThriftIDL.new.parse(open(file).read)
		ns = tree.namespaces['java']
		(tree.structs.values+tree.services.values+tree.exceptions.values).each do |s|
			s.ns = ns
			s.module_fullname = @module_fullname
		end

		@space.name[basename] = tree
		tree.includes.each do |f|
			load_idl File.join(dirname, f)
		end

		tree
	end

	def extract_structs(types)
		(types.flatten-['void']).compact.select{|t| t.category==:struct }.uniq
	end

	def load(filename)
		@basename = File.basename(filename, '.thrift')
		@space.root = load_idl(filename)
		@ns = @space.root.namespaces['cocoa'] || ''
	end

	def run(dir)
		FileUtils.mkdir_p src_path(dir)
		@space.root.structs.each do |name, s|
			structs = extract_structs(s.fields.map{|f| f.type.types(@space)})
			open(File.join(src_path(dir), "#{s.proxy_class_name}.java"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/struct.proxy.java.erb").read, nil, '-').result(binding)
			end
		end
	end
end

if $0 == __FILE__
	exit((puts "Usage #{$0} outdir *.thrift") || 1) unless ARGV.count > 1
	(1...ARGV.count).each do |i|
		puts "Load: #{ARGV[i]}"
		generator = AndroidGenerator.new
		generator.module_fullname = "JpMasuidriveTiEvernote"
		generator.load(ARGV[i])
		generator.run(ARGV[0])
	end
end
