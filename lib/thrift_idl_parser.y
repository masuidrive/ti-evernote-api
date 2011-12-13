#!/usr/bin/env racc -o thrift_idl_parser.rb 

class ThriftIDL
#  prechigh
#  preclow
rule
  Document
        # header
        : Document INCLUDE LITERAL { @includes << val[2] }
        | Document CPP_INCLUDE LITERAL { @cpp_includes << val[2] }
        | Document NAMESPACE IDENT IDENT { @namespaces[val[2]] = val[3] }

        # definition
        | Document Const { @consts[val[1].name] = val[1] }
        | Document Typedef { @typedefs[val[1].name] = val[1] }
        | Document Enum { @enums[val[1].name] = val[1] }
        | Document Senum { @senums[val[1].name] = val[1] }
        | Document Struct { @structs[val[1].name] = val[1] }
        | Document Exception { @exceptions[val[1].name] = val[1] }
        | Document Service { @services[val[1].name] = val[1] }
        |


  Const
        : CONST FieldType IDENT '=' ConstValue ListSeparator
          { result = ConstOp.new(val[2], val[1], val[4]) }
  
  Typedef
        : TYPEDEF DefinitionType IDENT
          { result = TypedefOp.new(val[2], val[1]) }
  
  Enum
        : ENUM IDENT '{' EnumLoop '}'
          { result = EnumOp.new(val[1], Hash[*val[3].flatten]) }
  
  EnumLoop
        : EnumLoop IDENT ListSeparator
          { result << [val[1], result.last ? result.last[1] + 1 : 1] }
        | EnumLoop IDENT '=' NUMBER ListSeparator
          { result << [val[1], val[3].to_i] }
        |
          { result = [] }

  Senum
        : SENUM IDENT '{' SenumLoop '}'
          { result = SenumOp.new(val[1], val[3]) }

  SenumLoop
        : SenumLoop LITERAL ListSeparator
          { result << val[1] }
        |
          { result = [] }
  
  Struct
        : STRUCT IDENT '{' Fields '}'
          { result = StructOp.new(val[1], val[3]) }
  
  Exception
        : EXCEPTION IDENT '{' Fields '}'
          { result = ExceptionOp.new(val[1], val[3]) }
  
  Service
        : SERVICE IDENT EXTENDS IDENT '{' Functions '}'
          { result = ServiceOp.new(val[1], val[5], val[3]) }
        | SERVICE IDENT '{' Functions '}'
          { result = ServiceOp.new(val[1], val[3]) }


# Field
  Fields
        : Fields Field
          { result << val[1] }
        | { result = []}

  Field
        : FieldID FieldReq FieldType IDENT '=' ConstValue ListSeparator
          { result = FieldOp.new(val[3], val[2], val[0], val[1], val[5]) }
        | FieldID FieldReq FieldType IDENT ListSeparator
          { result = FieldOp.new(val[3], val[2], val[0], val[1]) }


  FieldID
        : NUMBER ':'
          { result = val[0].to_i }
        |

  FieldReq
        : REQUIRED
        | OPTIONAL
        |


# Functions

  Functions
        : Functions Function
          { result << val[1] }
        | { result = []}
  
  Function
        : Oneway FunctionType IDENT '(' Fields ')' Throws ListSeparator
          { result = FunctionOp.new(val[2], val[1], val[4], val[0], val[6]) }
  
  Oneway
        : ONEWAY
          { result = true }
        | { result = false }
  
  FunctionType
        : FieldType
        | VOID
  
  Throws
        : THROWS '(' Fields ')'
          { result = val[2] }
        | { result = []}


# Types

  FieldType
        : IDENT { result = TypeOp.new(:ident, val[0]) }
        | BaseType
        | ContainerType
  
  DefinitionType
        : BaseType
        | ContainerType
  
  BaseType
        : BOOL   { result = TypeOp.new(:primitive, val[0]) }
        | BYTE   { result = TypeOp.new(:primitive, val[0]) }
        | I16    { result = TypeOp.new(:primitive, val[0]) }
        | I32    { result = TypeOp.new(:primitive, val[0]) }
        | I64    { result = TypeOp.new(:primitive, val[0]) }
        | DOUBLE { result = TypeOp.new(:primitive, val[0]) }
        | STRING { result = TypeOp.new(:primitive, val[0]) }
        | BINARY { result = TypeOp.new(:primitive, val[0]) }
        | SLIST  { result = TypeOp.new(:primitive, val[0]) }
  
  ContainerType
        : MapType | SetType | ListType
  
  MapType
        : MAP CppType '<' FieldType ',' FieldType '>'
          { result = MapOp.new(val[3], val[5]) }
  
  SetType
        : SET CppType '<' FieldType '>'
          { result = SetOp.new(val[3]) }
  
  ListType
        : LIST '<' FieldType '>' CppType
          { result = ListOp.new(val[2]) }
  
  CppType
        : CPP_TYPE LITERAL
        |


# Constant Values

  ConstValue
        : NUMBER    { result = ConstValueOp.new(:number, val[0]) }
        | LITERAL   { result = ConstValueOp.new(:string, val[0]) }
        | IDENT     { result = ConstValueOp.new(:ident, val[0]) }
        | ConstList { result = ConstValueOp.new(:list, val[0]) }
        | ConstMap  { result = ConstValueOp.new(:map, val[0]) }

  ConstList
        : '[' ConstListLoop ']'
          { result = val[1] }

  ConstListLoop
        : ConstListLoop ConstValue ListSeparator
          { result << val[1] }
        | { result = [] }

  ConstMap
        : '{' ConstMapLoop '}'
          { result = Hash[*val[1]]}

  ConstMapLoop
        : ConstMapLoop ConstValue ':' ConstValue ListSeparator
          { result << [val[1], val[3]] }
        | { result = [] }


# Basic Definitions

  ListSeparator
        : ','
        | ';'
        |
  
end

---- header
require 'tokenizer'

ConstOp = Struct.new(:name, :type, :object)
TypedefOp = Struct.new(:name, :type)
EnumOp = Struct.new(:name, :items)
SenumOp = Struct.new(:name, :items)
StructOp = Struct.new(:name, :fields)
FieldOp = Struct.new(:name, :type, :id, :req, :value)
ExceptionOp = Struct.new(:name, :fields)
ServiceOp = Struct.new(:name, :functions, :extends)
FunctionOp = Struct.new(:name, :result, :arguments, :oneway, :throws)
ConstValueOp = Struct.new(:type, :value)
TypeOp = Struct.new(:category, :name)
class SetOp < TypeOp
  attr_accessor :type
  def initialize(type=nil)
    @type = type
    super(:set, nil)
  end
end
class ListOp < TypeOp
  attr_accessor :type
  def initialize(type=nil)
    @type = type
    super(:list, nil)
  end
end
class MapOp < TypeOp
  attr_accessor :key, :object
  def initialize(key=nil, object=nil)
    @key, @object = key, object
    super(:map, nil)
  end
end


---- inner
attr_reader :includes, :cpp_includes, :namespaces
attr_reader :consts, :typedefs, :enums, :senums, :structs, :exceptions, :services

def parse(str)
  @includes = []
  @cpp_includes = []
  @namespaces = {}

  @consts = {}
  @typedefs = {}
  @enums = {}
  @senums = {}
  @structs = {}
  @exceptions = {}
  @services = {}

  @tokens = tokenize(str)
  do_parse
  self
end

def next_token
  @tokens.shift
end
---- footer

if defined?(RSpec)
  describe "lex" do
    before do
      @idl = ThriftIDL.new.parse <<__IDL__
include "Types.thrift"
include "Errors.thrift"

cpp_include "Cpp1.thrift"
cpp_include "Cpp2.thrift"

namespace cocoa EDAM
namespace php edam_userstore

const i16 EDAM_VERSION_MAJOR = 1
const set<string> EDAM_MIME_TYPES = [
  EDAM_MIME_TYPE_GIF,
  EDAM_MIME_TYPE_JPEG
];

typedef i32 UserID
typedef string Guid

enum EDAMErrorCode {
  UNKNOWN = 1,
  BAD_DATA_FORMAT = 2
}

senum Demo {
  "A"
  "B"
}

struct AuthenticationResult {
  1:  required  Types.Timestamp currentTime,
  2:  required  string authenticationToken ,
  5:  optional  list<string> viewedPromotions,
}

exception EDAMSystemException {
  1:  required  EDAMErrorCode errorCode,
  2:  optional  string message
}

service NoteStore {
  SyncState getSyncState(1: string authenticationToken)
    throws (1: Errors.EDAMUserException userException,
            2: Errors.EDAMSystemException systemException),

}
__IDL__
    end
    
    it "include" do
      @idl.includes.sort.should == %w(Types.thrift Errors.thrift).sort
    end
    
    it "cpp_include" do
      @idl.cpp_includes.sort.should == %w(Cpp1.thrift Cpp2.thrift).sort
    end

    it "namespace" do
      @idl.namespaces.count.should == 2
      @idl.namespaces['cocoa'].should == 'EDAM'
      @idl.namespaces['php'].should == 'edam_userstore'
    end
    
    it "consts" do
      @idl.consts.count.should == 2
      
      evm = @idl.consts['EDAM_VERSION_MAJOR']
      evm.name.should == 'EDAM_VERSION_MAJOR'
      evm.object.type.should == :number
      evm.object.value.should == 1
      evm.type.category.should == :primitive
      evm.type.name.should == 'i16'

      emt = @idl.consts['EDAM_MIME_TYPES']
      emt.name.should == 'EDAM_MIME_TYPES'

      emt.type.should be_a_kind_of(SetOp)
      emt.type.category.should == :set
      emt.type.type.name.should == 'string'

      emt.object.value.should be_a_kind_of(Array)
      emt.object.value.map(&:type).sort.should == [:ident, :ident].sort
      emt.object.value.map(&:value).sort.should == %w(EDAM_MIME_TYPE_GIF EDAM_MIME_TYPE_JPEG).sort
    end
    
    it "typedef" do
      @idl.typedefs.count.should == 2
      @idl.typedefs['UserID'].name.should == 'UserID'
      @idl.typedefs['UserID'].type.category.should == :primitive
      @idl.typedefs['UserID'].type.name.should == 'i32'
      @idl.typedefs['Guid'].name.should == 'Guid'
      @idl.typedefs['Guid'].type.category.should == :primitive
      @idl.typedefs['Guid'].type.name.should == 'string'
    end

    it "enum" do
      @idl.enums.count.should == 1
      @idl.enums['EDAMErrorCode'].items.count.should == 2
      @idl.enums['EDAMErrorCode'].items['UNKNOWN'].should == 1
      @idl.enums['EDAMErrorCode'].items['BAD_DATA_FORMAT'].should == 2
    end

    it "senum" do
      @idl.senums.count.should == 1
      @idl.senums['Demo'].items.sort.should == %w(A B).sort
    end

    it "struct" do
      @idl.structs.count.should == 1
      arf = @idl.structs['AuthenticationResult'].fields
      arf.count.should == 3
      arf[0].name.should == 'currentTime'
      arf[0].type.category.should == :ident
      arf[0].type.name.should == 'Types.Timestamp'
      arf[0].req.should == 'required'
      arf[0].id.should == 1
      
      arf[1].name.should == 'authenticationToken'
      arf[1].type.category.should == :primitive
      arf[1].type.name.should == 'string'
      arf[1].req.should == 'required'
      arf[1].id.should == 2

      arf[2].name.should == 'viewedPromotions'
      arf[2].type.should be_kind_of(ListOp)
      arf[2].type.type.category.should == :primitive
      arf[2].type.type.name.should == 'string'
      arf[2].req.should == 'optional'
      arf[2].id.should == 5
    end

    it "exceptions" do
      @idl.exceptions.count.should == 1
      fields = @idl.exceptions['EDAMSystemException'].fields
      fields.count.should == 2
      fields[0].name.should == 'errorCode'
      fields[0].type.category.should == :ident
      fields[0].type.name.should == 'EDAMErrorCode'
      fields[0].req.should == 'required'
      fields[0].id.should == 1
      fields[1].name.should == 'message'
      fields[1].type.category.should == :primitive
      fields[1].type.name.should == 'string'
      fields[1].req.should == 'optional'
      fields[1].id.should == 2
    end

    it "service" do
      @idl.services.count.should == 1
      s = @idl.services['NoteStore']
      s.name.should == 'NoteStore'
      s.functions.count.should == 1
      s.functions[0].name.should == 'getSyncState'
      s.functions[0].result.category.should == :ident
      s.functions[0].result.name.should == 'SyncState'
      s.functions[0].arguments.count.should == 1
      s.functions[0].arguments[0].name.should == 'authenticationToken'
      s.functions[0].arguments[0].type.category.should == :primitive
      s.functions[0].arguments[0].type.name.should == 'string'
      s.functions[0].arguments[0].id.should == 1
      s.functions[0].throws.count.should == 2
      s.functions[0].throws[0].id.should == 1
      s.functions[0].throws[0].name.should == 'userException'
      s.functions[0].throws[0].type.category.should == :ident
      s.functions[0].throws[0].type.name.should == 'Errors.EDAMUserException'
      s.functions[0].throws[1].id.should == 2
      s.functions[0].throws[1].name.should == 'systemException'
      s.functions[0].throws[1].type.category.should == :ident
      s.functions[0].throws[1].type.name.should == 'Errors.EDAMSystemException'
    end
    
  end
end