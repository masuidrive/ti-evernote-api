#!/usr/bin/env ruby
require 'thrift_idl_parser'

require 'rubygems'
require 'active_support'
require 'erb'

ERB_PATH = File.join(File.dirname(__FILE__), 'ios')

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
	attr_accessor :ns, :module_name

	def class_name
		"#{@ns}#{name.split('.').last.sub(/^[a-z]/,&:upcase)}"
	end

	def proxy_class_name
		"#{@module_name}#{name.split('.').last.sub(/^[a-z]/,&:upcase)}Proxy"
	end
end

class StructOp
	attr_accessor :ns, :module_name

	def class_name
		"#{@ns}#{name.split('.').last.sub(/^[a-z]/,&:upcase)}"
	end

	def proxy_class_name
		"#{@module_name}#{name.split('.').last.sub(/^[a-z]/,&:upcase)}Proxy"
	end
end

class ServiceOp
	attr_accessor :ns, :module_name

	def class_name
		"#{@ns}#{name.sub(/^[a-z]/,&:upcase)}Client"
	end

	def proxy_class_name
		"#{@module_name}#{name.sub(/^[a-z]/,&:upcase)}ClientProxy"
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
		@obj_type = OBJC_TYPES[name] if category==:primitive
	end

	TI_PRIMITIVE = %w(bool i16 i32 i64 double string enum)

	OBJC_TYPES = {
		'void' => ["nil", "nil"],
		'bool' => ["NUMBOOL(%s)", "[%s boolValue]"],
		'i16' => ["NUMINT(%s)", "[%s integerValue]"],
		'i32' => ["NUMLONG(%s)", "[%s longValue]"],
		'i64' => ["NUMLONGLONG(%s)", "[%s longLongValue]"],
		'double' => ["NUMDOUBLE(%s)", "[%s doubleValue]"],
		'string' => ["%s", "[TiUtils stringValue:%s]"],
		'binary' => ["[[[TiBlob alloc] initWithData:%s mimetype:@\"application/octet-stream\"] autorelease]", "[%s data]"],
		'enum' => ["NUMINT(%s)", "[%s integerValue]"]
	}

	def types(space=nil)
		result = [self, @type, @key, @object].compact - ['void']
		result.each{|r| r.parse_ident(space)} if space
		result
	end

	def titanium(space, label, nsobject=false)
		return label if nsobject && self.category==:primitive && TI_PRIMITIVE.include?(self.name)
		return @obj_type[0] % label if @obj_type
		parse_ident space
		
		case self.category
		when :enum
			return OBJC_TYPES['i32'][0] % label

		when :list
			return "arrayMap(#{label}, ^(id item) { return #{self.type.titanium(space, 'item', true)}; })"
		
		when :set
			return "[arrayMap(#{label}, ^(id item) { return #{self.type.titanium(space, 'item')}; }) allObjects]"
		
		when :map
			return <<-__OBJC__.chomp
dictionaryMap(#{label}, ^(id key, id obj) {
        return [NSArray arrayWithObjects: #{key.titanium(space, 'key', true)}, #{object.titanium(space, 'obj', true)}, nil];
    })
__OBJC__
		
		when :struct
			return "[[[#{@struct.proxy_class_name} alloc] initWithObject: #{label}] autorelease]"
		
		when :typedef
			@typedef.type.titanium(space, label, nsobject)
		
		when :ident
			raise "Unknow ident #{name}"
		
		else
			raise "Unknow category #{self.category}"
		
		end
	end

	def objc(space, label, nsobject=false)
		return label if nsobject && self.category==:primitive && TI_PRIMITIVE.include?(self.name)
		return @obj_type[1] % label if @obj_type
		parse_ident space
		
		case self.category
		when :enum
			return OBJC_TYPES['i32'][1] % label
		
		when :list
			return "arrayMap(#{label}, ^(id item) { return #{type.objc(space, 'item', true)}; })"
		
		when :set
			return "[arrayMap(#{label}, ^(id item) { return #{type.objc(space, 'item')}; }) allObjects]"
		
		when :map
			return <<-__OBJC__.chomp
dictionaryMap(#{label}, ^(id key, id obj) {
        return [NSArray arrayWithObjects: #{key.objc(space, 'key', true)}, #{object.objc(space, 'obj', true)}, nil];
    })
__OBJC__
		
		when :struct
			return "((#{@struct.proxy_class_name}*)#{label}).object"
		
		when :typedef
			return @typedef.type.objc(space, label, nsobject)
		
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


class IOSGenerator
	attr_accessor :module_name

	def initialize(filename=nil)
		@space = Space.new
	end

	def load_idl(file)
		basename = File.basename(file, '.thrift')
		return if @space.name[basename]
		dirname = File.dirname(file)
		
		tree = ThriftIDL.new.parse(open(file).read)
		ns = tree.namespaces['cocoa']
		(tree.structs.values+tree.services.values+tree.exceptions.values).each do |s|
			s.ns = ns
			s.module_name = @module_name
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
		@space.root.exceptions.each do |name, exception|
			# structs = extract_structs(exception.fields.map{|f| f.type.types(@space)})
			open(File.join(dir, "#{exception.proxy_class_name}.m"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/exception.m.erb").read, nil, '-').result(binding)
			end
		end

		@space.root.structs.each do |name, s|
			structs = extract_structs(s.fields.map{|f| f.type.types(@space)})
			open(File.join(dir, "#{s.proxy_class_name}.m"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/struct.proxy.m.erb").read, nil, '-').result(binding)
			end
			open(File.join(dir, "#{s.proxy_class_name}.h"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/struct.proxy.h.erb").read, nil, '-').result(binding)
			end
		end

		@space.root.services.each do |name, s|
			arg_types = s.functions.map(&:arguments).flatten.map{|f| f.type.types(@space)}
			result_type = s.functions.map{|f| f.result=='void' ? nil : f.result.types(@space)}
			structs = extract_structs(arg_types+[result_type])
			open(File.join(dir, "#{s.proxy_class_name}.m"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/service.proxy.m.erb").read, nil, '-').result(binding)
			end
			open(File.join(dir, "#{s.proxy_class_name}.h"), 'w') do |f|
				f.write ERB.new(open("#{ERB_PATH}/service.proxy.h.erb").read, nil, '-').result(binding)
			end
		end

		consts = @space.root.consts
		enums = @space.root.enums
		open(File.join(dir, "#{@module_name}#{@basename}Consts.m"), 'w') do |f|
			f.write ERB.new(open("#{ERB_PATH}/consts.m.erb").read, nil, '-').result(binding)
		end

	end
end

if $0 == __FILE__
	exit((puts "Usage #{$0} outdir *.thrift") || 1) unless ARGV.count > 1
	(1...ARGV.count).each do |i|
		puts "Load: #{ARGV[i]}"
		generator = IOSGenerator.new
		generator.module_name = "JpMasuidriveTiEvernote"
		generator.load(ARGV[i])
		generator.run(ARGV[0])
	end
end
