Evernote Web Service API SDK
a.k.a. Evernote Data Access and Management (EDAM) API

The EDAM API is distributed under terms described in the LICENSE.txt file.

=========
Contents:
=========

doc/
  html/
    Contains HTML reference documentation for generated API calls and data
    structures. This is a representation of the language-independent Thrift
    values, so it is not specific to a single client language. 
  javadoc/
    Contains HTML documentation for the generated API calls for Java.
    
thrift/
  Contains the source IDL files, along with inline documentation for all
  structures and services. You should not need to use these files.
    
android/
  src/
    Java source files that can be used to replace Thrift-generated code
    on Android for more efficient memory use
  sample/HelloEvernote/
    Sample Android application that demonstrates the use of Intents to
    interact with Evernote for Android
  sample/HelloEDAM/
    Sample Android application that demonstrates the use of the EDAM
    API on Android

as3/
  lib/
  src/
  sample/

cocoa/
  src/
    Mac Cocoa source files, generated from the Thrift IDLs    
  sample/
    Sample iOS application that demonstrates the use of the EDAM API

cpp/
  C++ source files, generated from the Thrift IDLs

csharp/
  src/
    C# source files, generated from the Thrift IDLs
  sample/
    C# example client code

java/
  src/
    Java source files, generated from the Thrift IDLs
  lib/
    JAR files for the EDAM API and the Thrift runtime library  
  sample/client/
    Java example client code    
  sample/oauth/
    Java example web application code

javame/
  src/
    Java Micro Edition (CLDC 1.1) source files for runtime and generated
    classes.
  sample/
    Skeleton Java ME sample code

perl/
  lib/
    Generated Perl stubs for EDAM and Thrift Perl runtime classes

php/
  lib/
    Generated PHP stubs and the Thrift PHP runtime classes
  sample/client/
    PHP example client code
  sample/oauth/
    PHP example web application code    

python/
  lib/
    Generated Python stubs and the Thrift Python runtime classes
  sample/
    Python example client code

ruby/
  lib/
    Generated Ruby stubs and the Thrift Ruby runtime classes
  sample/client/
    Ruby example client code
  ruby/oauth/
    Ruby example web application code
