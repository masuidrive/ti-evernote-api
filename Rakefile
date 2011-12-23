$LOAD_PATH << './lib'

THRIFT_PATH = './evernote-api-1.19/thrift/'
MODULE_ID = 'jp.masuidrive.ti.evernoteapi'


task :default => [:build_ios_module]


desc "generate module for ios"
task :generate_ios_module do
	require 'ios_generator'
	Dir::glob(File.join("#{THRIFT_PATH}", "*.thrift")).each do |filename|
		puts "Load: #{filename}"
		generator = IOSGenerator.new
		generator.module_name = MODULE_ID.sub(/^[a-z]/, &:upcase).gsub(/\.[a-z]/, &:upcase).gsub('.', '')
		generator.load(filename)
		generator.run('ios_module/Classes/EvernoteProxy/')
	end
end

desc "build module for ios"
task :build_ios_module => [:generate_ios_module] do
	exec '(cd ios_module && ./build.py)'
end
