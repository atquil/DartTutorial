import 'dart:io';

/// Isolates (https://dart.dev/guides/language/language-tour#isolates): All dart code run inside isolate. Each
///         Dart isolate has a single thread of execution and shares no mutable objects with other isolates.
///
///  Exceptions : These are errors indicating that something unexpected happened. If the exception isn’t caught,
///               the isolate that raised the exception is suspended, and typically the isolate and its program are terminated.
///
///  Catch : Catching an exception gives chance to handle the exception.
///          StackTrace: It intended to convey information to the user about the call sequence that triggered an exception.
///
///  Rethrow : When you want to handle the exception in the calling method.
void main(List<String> args) {
  // Call Try Catch block
  var checkTryCatch1 = TryCatch(2);
  checkTryCatch1.checkTryCatch();
  checkTryCatch1.checkTryCatchFinally();

  // Call Try Catch and Finally block
  var checkTryCatch2 = TryCatch(5);
  checkTryCatch2.checkTryCatch();
  checkTryCatch2.checkTryCatchFinally();

  // Throw arbitrary objects as exception
  var arbitraryException = TryCatch(5);
  arbitraryException.throwArbitraryException();

  // call Try Catch with intent to catch Stack trace as well.
  var tryCatchWithStackTrace = TryCatch(15);
  tryCatchWithStackTrace.checkLambdaForException();

  // call Try Catch with intent to handle exception here.
  try {
    var tryCatchWithThrow = TryCatch(100);
    tryCatchWithThrow.cllMethodWithThrow();
  } catch (e) {
    print("Handling exception here in the calling method");
  }

  // Custom Exception

  try {
    WithCustomException withCustomException = WithCustomException();
  } catch (E) {
    print(E);
  }
}

class TryCatch {
  var num;

  TryCatch(this.num);

  // Simple Try Catch : catch(e) can handle any kind of exception thrown
  void checkTryCatch() {
    try {
      if (num > 2) throw FormatException(" Some Example Exception ");
    } on FormatException catch (e) {
      print("Inside checkTryCatch: $e");
    }
  }

  /// Try Catch finally : finally block is optional only applied if  we have to implement some method
  /// Multiple Catch    : Generally, you should define the catch type,
  ///                     but if catch is not specified catch(e) can handle any type thrown
  /// On and Catch : We can use (on) or (catch) or both.
  ///       a. Only On : When we need to specify the exception type.
  ///       b. Catch : When exception handler needs the exception object.
  void checkTryCatchFinally() {
    try {
      if (num > 2) throw Exception(" Some Example Exception ");
    } on IOException {
      // * We don't need to handle exception object
      print("Got Io Exception");
    } on Exception catch (e) {
      //* We want to handle exception object
      print("Unknown Exception with handling exception object: $e ");
    } catch (e) {
      //* Any other type of exception.
      print("No specific type for exception: $e");
    } finally {
      print("No matter what this block will surely print.");
    }
  }

  // Usually , you should not use in production, as it throws types that implement exception
  void throwArbitraryException() {
    try {
      throw "Just throwing arbitrary objects as exception";
    } catch (e) {
      print(e);
    }
  }

  //Lambda to throw exception
  void checkLambdaForException() {
    try {
      if (num > 2) throw UnimplementedError("something here");
    } on UnimplementedError catch (e) {
      print('Exception details:\n $e');
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    }
  }

  void cllMethodWithThrow() {
    try {
      if (num > 1) throw Exception("SomeException to be thrown to main()");
    } catch (e, s) {
      print("Exception : $e");
      print("StackTrace: \n $e");
      rethrow; // Allowing caller to see the exception.
    }
  }
}

class SomeCustomException implements Exception {
  String customMessage() => 'This is custom exception';
}

class WithCustomException {
  void someMethod() {
    throw new SomeCustomException();
  }
}
