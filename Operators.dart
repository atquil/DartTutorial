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
      "************* 2. Relational Operator (return boolean):== , !=, >= , < =  , > , <  ***********");

  if (finalValue == 4.0) print("Yes");
  if (finalValue != 5.0) print("No");
  if (finalValue >= 4.0) print("Ye");
  if (finalValue <= 5.0) print("no");

  print("************* 3. Unary Operator: IncrementValue(++x), PostIncrement (x++), PreDec(--x), PostDec(x--) ***********");

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

  print("************* 4. Assignment Operator : = , += ***********");
 
  finalValue *= 2; // Compound assignment
  print("[Assignment Operator]: Multiplying the value to 2 :$finalValue");

  print("************* 5. Conditional Operators: if-else, switch etc ***********");
  
  // example with logical operator

  print("************* 6. Logical Operator: && , ||  and !expr ***********");

  if (finalValue == 12.0 && finalValue > 2) print(finalValue);
  if (finalValue < 2 || finalValue > 2) print(finalValue);
  if (!(finalValue == 22)) print(r"!expr : inverts the expression ");

  
  print("************* 7.  Ternary operator *****************");
  
  int x = 100;
  var result = x % 2 == 0 ? "Even" : "Odd";
  print(result);


print("************* 8. Type Test Operator : is , !is, as  ***********");

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


  print("************* 9. Null Aware Operators *****************");

  // * Null Aware Operators (??) (?.)
  // ! Problem : Generally, when we are dealing with JSON parsing, we have to do the null check for the object
  // !           and we do that using if (response == null) return some error, though it is not a bad thing, but it is not concise.

  var a;
  // 1. (??) evaluates expression if it's null
  print(a ?? "(??) It will not change the value x from null. $a");
  print(a);

  // 2. (??=) Assign the value if it's null
  print("(??=)  Value of a should be null : $a");
  var b = a ??= 33; // It means if value of a is null then assign 33
  print("(??=)  It will assign new value ");

  // 3. (?.) --> If null do nothing otherwise get the said value
  var someDoubleValue;
  var someStringValue = someDoubleValue?.toString(); // It will be null
  print("(?.) Print only if not null : $someStringValue");
  someDoubleValue = 22322.22;
  someStringValue = someDoubleValue?.toString(); // It will be null
  print("(?.) Print value in string : $someStringValue");

  // 4. (...?) -> Operational Spread Operator: Insert a list into another only if it's not null
  var listWithValue1 = [1, 2, 3];
  var listWithValue2 = [4, 5, 6];
  var finalList = [...listWithValue1, ...listWithValue2];
  print("FinalList: $finalList");
  var someNullList;
  //finalList = [...finalList, ...someNullList]; // Error is thrown.
  // print("FinalList: $finalList");
  finalList = [...finalList, ...?someNullList];
  print("FinalList: $finalList");

  print("************* 7. Cascade Notation ***********");
  //Cascades (.., ?..) allow you to make a sequence of operations on the same object

  //Code
  var changeValue = CascadeExample()
    ..someNumber = 32
    ..someValue = "youtube";

  print(changeValue.someNumber);

  // How we had to do earlier
  var oldChangeValue = CascadeExample();
  oldChangeValue.someNumber = 21212112;
  oldChangeValue.someValue = "oldType";
  print(oldChangeValue);

  ///If the object that the cascade operates on can be null, then use a null-shorting cascade (?..) for the first operation.
  ///Starting with ?.. guarantees that none of the cascade operations are attempted on that null object.

  // When to use ?.. : Suppose, you are getting some value from some unknown place, then it can be null so we use ?..

  //Nested Cascade
  var someValueOfNestedCascade = NestedCascade()
    ?..someValueInNested = "SomeValueIfNestedCascadeIsNotNull"
    ..cascadeExample = (CascadeExample()
      ..someNumber = 22
      ..someValue = "Wow Nested Value");

  print(someValueOfNestedCascade.cascadeExample.someValue);
}

class NestedCascade {
  String someValueInNested = "Something";
  late CascadeExample cascadeExample;
}

class CascadeExample {
  String someValue = "atquil";
  int someNumber = 2121;
}
