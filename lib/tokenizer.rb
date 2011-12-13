#!/usr/bin/env ruby

require 'strscan'

RESERVED_WORDS = %w(include cpp_include namespace const typedef enum senum struct exception service extends required optional oneway void throws bool byte i16 i32 i64 double string binary slist map set list cpp_type)
OBSOLETED_WORDS = %w(php_namespace xsd_namespace xsd_optional xsd_nillable xsd_attrs xsd_all)

def tokenize(str)
	s = StringScanner.new(str+"\n")
	result = []
	while !s.eos?
		case
		when s.scan(/\s+/)
			# noop
		
		when s.scan(%r((/\*.*?\*/|//.*?\n))m)
			# comment
		
		when s.scan(/[-+]?\d+(\.\d+([eE][-+]?\d+)?)?/)
			result << [:NUMBER, s[0].to_f]
		
		when s.scan(/[_a-zA-Z][-_.\w]*/)
			if RESERVED_WORDS.include?(s[0])
				result << [s[0].upcase.to_sym, s[0]]
			elsif OBSOLETED_WORDS.include?(s[0])
				raise "#{s[0]} is obsoleted!"
			else
				result << [:IDENT, s[0]]
			end
		
		when s.scan(/"((?:\\.|[^\\"])*)"/m)
			result << [:LITERAL, s[1]]
		
		when s.scan(/./)
			result << [s[0], s[0]]
		
		end
	end
	result
end

if defined?(RSpec)
	describe "lex" do
		it "empty" do
			tokens = tokenize('')
			tokens.length.should == 0
		end
		
		it "text" do
			tokens = tokenize('include "Types.thrift"')
			tokens.should == [[:INCLUDE, 'include'], [:LITERAL, "Types.thrift"]]
		end
		
		it "number" do
			tokens = tokenize('1.2 3.4 +5 -6 7 1.234e5 -1.234e-5 12345  ')
			tokens.should == %w(1.2 3.4 +5 -6 7 1.234e5 -1.234e-5 12345).map{|v| [:NUMBER, v.to_f]}
		end
		
		it "symbol and ident" do
			tokens = tokenize('struct PublicUserInfo {  1: required i32 Types.UserID')
			tokens.should == [[:STRUCT, 'struct'], [:IDENT, 'PublicUserInfo'], ['{','{'], [:NUMBER, 1.0], [':',':'], [:REQUIRED,'required'], [:I32, 'i32'], [:IDENT, 'Types.UserID']]
		end

		it "c style comment" do
			tokens = tokenize('include /* te\nst" */ "Types.thrift"')
			tokens.should == [[:INCLUDE, 'include'], [:LITERAL, "Types.thrift"]]
		end

		it "c++ style comment" do
			tokens = tokenize(%(include  // test" \n\n"Types.thrift"))
			tokens.should == [[:INCLUDE, 'include'], [:LITERAL, "Types.thrift"]]
		end

		it "obsoleted words" do
			proc {
				tokenize(%(include xsd_optional aaa))
			}.should raise_error(RuntimeError, 'xsd_optional is obsoleted!')
		end
	end
end