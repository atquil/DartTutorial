# DartTutorial
This will cover from basic to advance topics, which will help you in working with Flutter. 


What is Dart ? 
Dart is a general-purpose, high-level modern programming language. It has two type of compilation technique 
    a. Just in Time Compilation (JOT) : 
            1. What ? Convert the byte code in machine code (native code)
            2. Help by compiling only those part which is being run by machine, thus providing feature of hot reload. 
    b. Ahead of Time Compilation (AOT) :
            1. What ? It converts the dart code in the optimized JavaScript code using dar2js compiler and run in all modern browser
            2. Helps by compiling the code, to be deployed in prod environment or to app-store etc. 

If you don't want to install any software then, use Dart Pad. 
Online Compiler : https://dart.dev/tools/dartpad 


Installation Steps: VS-CODE - Dart : https://dart.dev/tools/vs-code 

Other helpful links : 

For All users:
    1. Install VS-CODE : https://code.visualstudio.com/ 
    2. Install Android Studio : As it will help in installing android toolchain and different sdks for android : https://developer.android.com/studio 

For Mac Users Only : 
    1. Install HomeBrew if you are on Mac : https://brew.sh/ 
    2. Install X-CODE if on Mac form Play store.


Execution: 
How to execute in terminal : 
  a. dart --version : Check if dart installed / if you are using dartPad then click RUN button.
  b. cd to your folder location cd <folder location>
  c. dart <fileName.dart>  --> it will execute the file containing main()
  e. dart -c <fileName.dart> : Recommended for better debugging. 