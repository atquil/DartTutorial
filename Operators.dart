void main() {
  print(
      "************* 1. Arithmetic Operator: add(+),sub(-), mod(%), div(/),divWithIntQuotient(~/) ***********");

  // difference between / and ~/.
  print(3 / 2); // 1.5
  print(3 ~/ 2); //1
  var finalValue = 2 + 2 - 2 * 2 / 2 % 2;

  print(
      "[Arithmetic Operation]: Final value after arithmetic operation :$finalValue");

  print(
      "************* 2. Relational Operator (return boolean): (== , !=, >= , < =  , > , < ) ***********");

  if (finalValue == 4.0) print("Yes");
  if (finalValue != 5.0) print("No");
  if (finalValue >= 4.0) print("Ye");
  if (finalValue <= 5.0) print("no");

  print(
      "************* 3. Unary Operator: IncrementValue(++x), PostIncrement (x++), PreDec(--x), PostDec(x--) ***********");

  int unaryValue = 10;
  print("[Unary Operator]:FinalValue Before Unary Operation: $unaryValue");
  ++unaryValue;
  print("[Unary Operator]:PreIncrement : $unaryValue");
  unaryValue++;
  print("[Unary Operator]:PostIncrement : $unaryValue");
  --unaryValue;
  print("[Unary Operator]:PreDecrement : $unaryValue");
  unaryValue--;
  print("[Unary Operator]:PostDecrement : $unaryValue");

  print("************* 4. Assignment Operator : (= , +=) ***********");

  finalValue *= 2; // Compound assignment
  print("[Assignment Operator]: Multiplying the value to 2 :$finalValue");

  print(
      "************* 5. Conditional Operators: if-else, switch etc ***********");

  // example with logical operator

  print("************* 6. Logical Operator: (&& , ||  and !expr )***********");

  if (finalValue == 12.0 && finalValue > 2) print(finalValue);
  if (finalValue < 2 || finalValue > 2) print(finalValue);
  if (!(finalValue == 22)) print(r"!expr : inverts the expression ");

  print("************* 7.  Ternary operator *****************");

  int x = 100;
  var result = x % 2 == 0 ? "Even" : "Odd";
  print(result);

  print(
      "************* 8. [NEW] Type Test Operator :( is , !is, as)  ***********");

  /*
    Type Test Operators : To test expression runtime , can be useful in validation 
        a. is or !is : To check the expression 
        b. as : To cast an object to a particular type if and only if you are sure that the object is of that type
  */

  var someValue = 22;
  var someString = "SomeValue";

  print("[Type Test] : ${someString is String}");

  print("[Type Test] : ${someString is! String}");

  print("[Type Test] : ${someValue as int}");

  print(
      "************* 9. [NEW] Null Aware Operators:( ?., ??, ??=) *****************");

  // ! Problem : Generally, when we are dealing with JSON parsing, we have to do the null check for the object
  // !           and we do that using if (response == null) return some error, though it is not a bad thing, but it is not concise.
  /*
    Null Aware Operators: 
      a. What?: They are a set of operators that allow developers to safely access properties and methods of objects that may be null.
      b. Why? : Null aware operators can be useful for avoiding null 
                reference errors and for providing default values in cases where an object may be null
      c. Types:
            - "?." [Save from Runtime Error]Operator is used to safely access the PROPERTIES AND METHOD of an object that may be null. 
                  e.g  foo?.bar will return null instead of throwing an error.

            - "??" [Return Default Value if null]Operator is used to provide a default value if the object on the left-hand side of the operator is null. 
                  e.g foo?.bar ?? "default value" 
                      if foo is null ->  will return "default value"
                      if foo is not null -> will return the value of foo.bar
                      
            -"??=" [Assign Default Value if Null]Operator is used to assign a DEFAULT VALUE to a variable if the variable is null. 
                  e.g. foo ??= "default value" 
                      if foo is null -> will assign the value "default value" to the variable 
                      if foo is not null -> will leave foo unchanged if 
  */

  var a;
  print(a ?? "[Return Default value](??): As a: $a printing this ");

  var b = a ??= 33;
  print(
      "[Assign Default Value if null](??=) As a is :$a , assigning default value $b to b ");

  var someDoubleValue;
  var someStringValue = someDoubleValue?.toString();
  print(
      "[Save from Error if null](?.) We are doing .toString() operation on someDoubleValue which is $someDoubleValue." +
          "Thus it's saving us from error by returning: $someStringValue");

  print(
      "************* 10. Operational Spread Operator: (...?)Insert a list into another only if it's not null  ***********");

  var listWithValue1 = [1, 2, 3];
  var listWithValue2 = [4, 5, 6];

  var finalList = [...listWithValue1, ...listWithValue2];

  print("FinalList: $finalList");
  var someNullList;
  //finalList = [...finalList, ...someNullList]; // Error is thrown.
  // print("FinalList: $finalList");
  finalList = [...finalList, ...?someNullList];
  print("FinalList: $finalList");

  print("************* 11. Cascade Notation: (.., ?..)  ***********");

  /*
    Cascade Notation: For performing sequence of operations on the same object
            Cascade(...) : Operation without null check of object
            Null-shorting cascade(?..): Safely access the properties and methods of an object that may be null. 
              e.g. myObject?..myProperty = "foo" --> Set the property if the object is not null
            Nested cascade : Multilevel cascading. 
  */

  //Setting the value without using cascade
  var oldEmployee = EmployeeDetails();
  oldEmployee.name = '[oldEmp]: Resetting the name';
  print(oldEmployee.name);

  // Setting value using cascade
  var newEmployee = EmployeeDetails()
    ..name = '[Cascade Operation]: Setting name using cascade';

  print(newEmployee.name);

}
class EmployeeDetails {
  String name = "Old Object";
}
