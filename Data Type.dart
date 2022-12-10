/*

Why you need to learn data types ? 
It's the way of classify and organize different type of data. 

Programing language can be  - 
  1. Statically Typed (C++, JAVA, SWIFT) where variable is known at compile time  and it cannot change at runtime. 
  2. Dynamic Typed (Python, Ruby , JavaScript) That means variables can hold different kinds of data when you run the programe e.g. var 

As Dart is STATICALLY-TYPED-LANGUAGE, it helps to prevent common programming errors and make the code more reliable. 

Basic Dart Data Type : number (int, double, num) , String (UTF-16 code units) , Boolean , Lists , Sets
                       Maps , Runes(Unicode UTF-32 units), dynamic data type (var, dynamic)
 */

void main() {

  print("************* 1. NUMBERS (int,double,num)***********");

  int age = 25; // declare - Whole numbers -2^63 to 2^63
  double salary = 2.01; // declare - Floating point numbers

  print(age);
  print(salary);

  num doubleValue = 33.33;
  print(doubleValue);

  num intValue = 33;
  print(intValue);

  print("************* 2. String (UTF-16 code units) ***********");

  /// String : UTF-16 code units, for string literals. We can use it with following syntax:
  ///            a. '' or " " for single line
  ///            b. ''' ''' / """ """ for multiline
  ///            c. r - for raw string (symbols)

  String someStringSingleQuote = 'Hey there';
  print(someStringSingleQuote);

  String someStringDoubleQuote = "Hey back";
  print(someStringDoubleQuote);

  String someMultiLineString = '''
  Nice to meet you!
  Good work going on
  ''';
  print(someMultiLineString);

  String withRawPrefix = r'Raw string can even have \n ';
  print(withRawPrefix);

  // * Using the dollar symbol as prefix.
  print("Values inside string: $someStringSingleQuote");

  print(someStringSingleQuote + "Concatenation  the string");

  //For Expressions to get printed ${expression}
  print("With Expression ${32 / 31}");

  print("************* 3. Boolean ***********");

  bool isSame = (someStringSingleQuote == someStringDoubleQuote);
  print("[Bool] : $isSame");

  print("************* 4. List ***********");

  // List is similar to array in other prog language. - Ordered group of object, and has  Zero based indexing.
  List someList = [1, 2, 3, 4, "abc"];
  print("[List<>]: $someList");
  print("[List<>]: ${someList[0]}");

  // List with specific data type
  List<String> someStringList = ["a", "b", "c"];
  print("[List<String>]: $someStringList");

  print("************* 5. Sets ***********");

  /// Unordered unique items - otherwise runtime exception

  Set<String> someSet = {"a", "b", 'c'};
  print("[Set]: $someSet");

  print("************* 6. Maps ***********");

  /// Unordered collection of key and value pairs
  Map<int, String> names = {1: "Atul", 2: "Atul", 3: "Anand"};
  print("[Maps]: $names");

  print(
      "************* 7. Runes(Unicode UTF-32 units) ***********"); // https://pub.dev/documentation/characters/latest/

  /// Dart Runes are the special string of Unicode UTF-32 units : Symbols
  /// \u - represents unicode
  /// Require {} if hex value is less or greater than 4 digits.
  print('[RUNES] : \u2665'); // Heart shape
  print('[RUNES] : \u{1f600}'); // Smile Face

  print("--------------------------- Parsing  -----------------------");

  // Parse (convert one type to another)
  var salaryParsed = num.parse("11");
  print("[Parsing]: $salaryParsed");
}
