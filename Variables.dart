/* 
Variables : As Dart is statically typed language it uses TYPE-INTERFACE to determine the variable
            Also variables in dart STORE REFERENCE TO THE VALUE rather than containing the value
            Strongly typed variables use primitive data type like int, String, double boolean etc
Rules to create Variables name:
  a. Cannot contain special character
  b. firstCharacter should be [A-Z],[a-z]
  c. case sensitive
  d. only _<variable name> allowed for private variable e.g int _num
  e. $ symbol to access the variable.
  f. readable and relatable variable name is preferred.

*/

void main() {
  print("************* 1. var ***********");
  
  var varValue1 = 22;
  print("[Var] : ${varValue1.runtimeType}");

  var varValue2 = "someString";
  print("[Var] : ${varValue2.runtimeType}");



  print("************* 2. Situational Value (dynamic , object) ***********");
  
  dynamic dynamicValue = 22;
  print('dynamicValue : $dynamicValue');

  dynamicValue = 'atquil';
  print('anyValue: $dynamicValue');

  Object someRandomType = 'abc';
  print(someRandomType.runtimeType);
  someRandomType = 121;
  print(someRandomType.runtimeType);


  print("************* 3. Private Variable: Fixed value (_something)***********");
  
  int _somePrivateVariable = 2;
  print("[Private Variable]: $_somePrivateVariable]");


  print("************* 4. Null Safety - Objects become non-nullable i.e default value is mandatory  ***********");


  /*
  By default, dart implements null safety i.e. it require value to be initialized. 
        1. ? to check if value is null
        2. late : Lazy initializing of variable i.e  to declare a non-nullable variable that's initialized after it's declaration 
       
  */

  String? thisStringVariableCanBeNullIfNotAssigned;
  print("Is this null $thisStringVariableCanBeNullIfNotAssigned");

  late String someNameWillBeSetBeforeUse;

  someNameWillBeSetBeforeUse = "something";
  print(someNameWillBeSetBeforeUse);
  //! If you fail to initialize a late variable, a runtime error occurs when the variable is used.

  print("************* 5. Access Modifiers for Variables - Final, Const & Static ***********");
 
/*
 1. Final:Run-time constant
          A final field is the same, just without the setter,
          so the only way to set its value is in the constructor initializer list,
          and there is no way to change the value after that - hence the "final".

       
*/
  final name = 'Bob'; // Without a type annotation
  //name = 'Alice'; // Error: a final variable can only be set once.
  final String nickName = 'Bobby';

//  2. Const: Compile time constant (Uses explained when we will discuss const constructor)
  
  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere

  // We can use const to create constant values
  var someConstValue = const [];
  print(someConstValue.runtimeType);
  someConstValue = [2, 3, 4];
  print(someConstValue.runtimeType);

   

  /*
   3. Static: No need to create object to access the static variable or method.
      How to Accessing Static?
             a. Static Variable :  className.staticVariableName
             b. Static Method   :  className.staticMethod();
  */

  SomeClassWithStaticVariableAndMethod.someStaticValue = "Learning Dart"; // this value will be fixed.

  SomeClassWithStaticVariableAndMethod someClassWithStaticVariableAndMethod1 = SomeClassWithStaticVariableAndMethod();

  SomeClassWithStaticVariableAndMethod someClassWithStaticVariableAndMethod2 = SomeClassWithStaticVariableAndMethod();

  someClassWithStaticVariableAndMethod1.someNonStaticValue = "Dart is OOP";
  someClassWithStaticVariableAndMethod1.someMethod();
  SomeClassWithStaticVariableAndMethod.someStaticMethod();

  someClassWithStaticVariableAndMethod2.someNonStaticValue = "Flutter soon";
  someClassWithStaticVariableAndMethod2.someMethod();
  SomeClassWithStaticVariableAndMethod.someStaticMethod();

  // * Important : Final vs Const. https://www.youtube.com/watch?v=B1fIqdqwWw8&t=558s&ab_channel=ResoCoder

  
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
