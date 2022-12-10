/// Variables : Dart uses type-inference to determine the variable

/// Rules to create Variables name:
///   a. Cannot contain special character
///   b. firstCharacter should be [A-Z],[a-z]
///   c. case sensitive
///   d. only _<variable name> allowed for private variable
///   e. $ symbol to access the variable.
///   f. readable and relatable variable name is preferred.
///
/// * All variables in dart store a reference to the value rather than containing the value

void main(List<String> args) {
  print("************* 1. var ***********");
  // Compiler will automatically knows the type of data based on assigned variable because of infer type language.

  var varValue1 = 22;
  print("[Var] : ${varValue1.runtimeType}");

  var varValue2 = "someString";
  print("[Var] : ${varValue2.runtimeType}");

  // Strongly Typed variable using primitive data type
  int a = 1;
  String company = "atquil";
  bool isTutorial = true;
  double otherValue = 0.0;

  print(
      "[Var] : Number : $a   and youtube channel for dart and flutter tutorial is :$company with running status: $isTutorial");

  // Dynamic typed variables

  var no = 1;
  var varValue = " abc";

  print('Type of no is $no and name  : $varValue');

  //Dynamic with value based on situation

  dynamic dynamicValue = 22;
  print('dynamicValue : $dynamicValue');

  dynamicValue = 'atquil';
  print('anyValue: $dynamicValue');

  print("************* 2. Private Variable ***********");
  // Variable that cannot be changed outside it's defining scope -> _ symbol as prefix
  int _somePrivateVariable = 2;
  print("[Private Variable]: $_somePrivateVariable]");

  print("************* 3. Access Modifiers for Variables ***********");

  /// Three kind of access modifier : Final, Const and Static 
  /// 
  /// 1. Final:  A final field is the same, just without the setter,
  ///            so the only way to set its value is in the constructor initializer list,
  ///            and there is no way to change the value after that - hence the "final".
  ///           -> Run-time assignment

  final name = 'Bob'; // Without a type annotation
  //name = 'Alice'; // Error: a final variable can only be set once.
  final String nickName = 'Bobby';

  /// 2. Const: Compile time constant

  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere

  // We can use const to create constant values
  var someConstValue = const [];
  print(someConstValue.runtimeType);
  someConstValue = [2, 3, 4];
  print(someConstValue.runtimeType);

  // * Important : Final vs Const. https://www.youtube.com/watch?v=B1fIqdqwWw8&t=558s&ab_channel=ResoCoder
  // Constant use explained when we understand constructor. - Constant Constructor.

  /// 3. Static:  - The static variable and method is also identified as a class variable and method.
  ///             - No need to create object to access the static variable or method.
  ///    Accessing Static:
  ///           a. Static Variable :  className.staticVariableName
  ///           b. Static Method   :  className.staticMethod();

  //To access static values
  SomeClassWithStaticVariableAndMethod.someStaticValue =
      "Learning Dart"; // this value will be fixed.

  SomeClassWithStaticVariableAndMethod someClassWithStaticVariableAndMethod1 =
      SomeClassWithStaticVariableAndMethod();

  SomeClassWithStaticVariableAndMethod someClassWithStaticVariableAndMethod2 =
      SomeClassWithStaticVariableAndMethod();

  someClassWithStaticVariableAndMethod1.someNonStaticValue = "Dart is OOP";
  someClassWithStaticVariableAndMethod1.someMethod();
  SomeClassWithStaticVariableAndMethod.someStaticMethod();

  someClassWithStaticVariableAndMethod2.someNonStaticValue = "Flutter soon";
  someClassWithStaticVariableAndMethod2.someMethod();
  SomeClassWithStaticVariableAndMethod.someStaticMethod();

  print("************* . Null Safety  ***********");

  /// When we opt into null safety, then by default the objects are non-nullable
  ///  unless defined -> https://dart.dev/null-safety

  ///As Dart from Dart 2.12, to make variable non-nullable by default, for null values we use this
  String? thisStringVariableCanBeNullIfNotAssigned;
  print("Is this null $thisStringVariableCanBeNullIfNotAssigned");

  print("************* 3. Dynamic Variable  ***********");

  /// If an object can have different type of values, then we can either use
  /// 1. Object type
  /// 2. dynamic type

  Object someRandomType = 'abc';
  print(someRandomType.runtimeType);
  someRandomType = 121;
  print(someRandomType.runtimeType);

  dynamic someRandomDynamic = "abab";
  print(someRandomDynamic.runtimeType);
  someRandomDynamic = true;
  print(someRandomDynamic.runtimeType);

  print("************* 4. Default Value  ***********");
  //If null safety is enabled then we must initialize the values of non-nullable variable before use
  int mustInitializeValue = 0;

  print("************* 5. Late modifier  ***********");

  /// late modifier has two use cases
  ///     1. Declaring a non-nullable variable that’s initialized after its declaration.
  /// *   2. Lazily initializing a variable.
  ///
  /// When to use ? In null safety, if we are sure that the variable will be set , before use.

  late String someNameWillBeSetBeforeUse;

  someNameWillBeSetBeforeUse = "something";
  print(someNameWillBeSetBeforeUse);
  //! If you fail to initialize a late variable, a runtime error occurs when the variable is used.
}

class SomeClassWithStaticVariableAndMethod {
  static String? someStaticValue;
  String? someNonStaticValue;

  someMethod() {
    print(
        "Inside some method with someFixedValue: $someStaticValue and someNonStaticValue: $someNonStaticValue");
  }

  static someStaticMethod() {
    print("static can only have someStaticValues: $someStaticValue");
  }
}
