$LOAD_PATH << './lib'

THRIFT_PATH = './evernote-api-1.19/thrift/'
MODULE_ID = 'jp.masuidrive.ti.evernoteapi'


task :default => [:build_ios_module, :build_android_module]

desc "generate module for iOS"
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

desc "build module for iOS"
task :build_ios_module => [:generate_ios_module] do
	exec '(cd ios_module && ./build.py)'
end


desc "generate module for Android"
task :generate_android_module do
	require 'android_generator'
	Dir::glob(File.join("#{THRIFT_PATH}", "*.thrift")).each do |filename|
		puts "Load: #{filename}"
		generator = AndroidGenerator.new
		generator.module_fullname = MODULE_ID.sub(/^[a-z]/, &:upcase).gsub(/\.[a-z]/, &:upcase).gsub('.', '')
		generator.load(filename)
		generator.run('android_module/src/')
	end
end

desc "build module for Android"
task :build_android_module => [:generate_android_module] do
	exec '(cd android_module && ant)'
end
