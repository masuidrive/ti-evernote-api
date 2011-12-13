This directory contains an Android project for Eclipse that demonstrates how to use 
the Evernote web service API (EDAM) from an Android application. To open the project in
Eclipse, choose File->Import, expand the General folder, and select Existing Projects
into Workspace. Choose the HelloEDAM directory and click Finish. 

To build the project, you must first copy java/lib/libthrift.jar and 
java/lib/evernote-api-*.jar into the project's lib directory, sample/android/HelloEDAM/lib.

To run the sample application, you must obtain an API key. You can find API documentation 
and request an API key from http://www.evernote.com/about/developer/api/

The code in com.evernote.android.edam is Android-specific Thrift code that is more
memory efficient than the default generated Thrift classes. This code can also be found
in the API distribution's src/android directory. It makes use of the Simple Logging
Facade for Java (SLF4J, http://www.slf4j.org/) for logging. If you use a different logging
framework, you may wish to modify or remove the logging code in this package. We have 
included the SLF4J Android library in this project's lib directory.

The Evernote for Developers forum can be found at
http://forum.evernote.com/phpbb/viewforum.php?f=43
