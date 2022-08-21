import 'dart:io';

void main(List<String> args) {
  /// Async :  It executes the asynchronous operation in a thread.

  print("**************** 1. Simple Async **************");
  File file1 = new File("\someDataFile.txt");
  Future<String> fs = file1.readAsString();

  // returns a future object, it is an async method
  fs.then((data) => print(data));

  // once file is read, call back method is invoked
  print("Hi this is a example of Async using Future. ");

  print("**************** 2. Future **************");

  /// A future can have two states
  ///   - Uncompleted : When you call a function that returns a future, the function queues up the operation and returns an uncompleted future
  ///   - Completed: When a future’s operation finishes, the future completes with a value or with an error

  demoOfDelayedResponse();
  print("Printed first");

  print(
      "**************** 3. Future with (then) and (whenComplete) **************");

  /// Future allows to register a callback via the (then) method which
  /// is called then the Future is completed with a value.
  print("Then use");
  var languageName = getName();

  // nowUse the value.
  languageName.then((value) => print("Language is : $value"));

  //The whenComplete method is used to executed code after the complete or error as been received an processed.
  languageName.whenComplete(() => print("Completed processing"));
  print("Then end");

  print("**************** 4. Await and Async **************");
  // The await keywords allows to wait for the result of an asynchronous function and works only in async functions
  someAsyncMethodWithAwait();
}

Future<void> demoOfDelayedResponse() {
  return Future.delayed(Duration(seconds: 2),
      () => print("[Future]: 2 sec Delayed Response Test"));
}

// Future to return some Value
Future<String> getName() {
  // Simulate API call.
  return Future.delayed(Duration(seconds: 3), () => "Dart");
}

void someAsyncMethodWithAwait() async {
  await demoOfDelayedResponse();
  print("Using await, we are replicating sync call");
}
/// Complete Example : https://www.vogella.com/tutorials/Dart/article.html#await-and-async 