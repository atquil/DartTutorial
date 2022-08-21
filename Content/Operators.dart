void main(List<String> args) {
  //Operators doc : https://dart.dev/guides/language/language-tour#arithmetic-operators
  // All operators behave same as Java
  print("************* 1. Arithmetic Operator ***********");
  // * Arithmetic Operator :add(+),sub(-), mod(%), div(/),divWithIntQuotient(~/)

  // difference between / and ~/.
  print(3 / 2); // 1.5
  print(3 ~/ 2); //1
  var finalValue = 2 + 2 - 2 * 2 / 2 % 2;

  print(
      "[Arithmetic Operation]: Final value after arithmetic operation :$finalValue");

  print("************* 2. Relational Operator ***********");
  // * Relational Operator == , !=, >= , < =  , > , < . It returns Boolean

  if (finalValue == 4.0) print("Yes");
  if (finalValue != 5.0) print("No");
  if (finalValue >= 4.0) print("Ye");
  if (finalValue <= 5.0) print("no");

  print("************* 3. Unary Operator ***********");
  // * Unary Operator: IncrementValue(++x), PostIncrement (x++), PreDec(--x), PostDec(x--)

  print("[Unary Operator]:FinalValue Before Unary Operation: $finalValue");
  ++finalValue;
  print("[Unary Operator]:PreIncrement : $finalValue");
  finalValue++;
  print("[Unary Operator]:PostIncrement : $finalValue");
  --finalValue;
  print("[Unary Operator]:PreDecrement : $finalValue");
  finalValue--;
  print("[Unary Operator]:PostDecrement : $finalValue");

  print("************* 4. Assignment Operator ***********");
  // Assignment Operator: Assign value ot operator using = , but we can also combine it with arithmetic operators like  +,- etc.

  finalValue *= 2; // Compound assignment
  print("[Assignment Operator]: Multiplying the value to 2 :$finalValue");

  print("************* 4. Type Test Operator ***********");
  // * For testing the expressions runtime

  var someValue = 22;
  var someString = "SomeValue";

  //1. is
  print("[Type Test] : ${someString is String}");

  //2. is!
  print("[Type Test] : ${someString is! String}");

  //3. as : Use as operator to cast an object to a particular type if and only if you are sure that the object is of that type
  print("[Type Test] : ${someValue as int}");

  print("************* 5. Logical Operator ***********");
  // Logical Operator : && , ||  and !expr

  if (finalValue == 12.0 && finalValue > 2) print(finalValue);
  if (finalValue < 2 || finalValue > 2) print(finalValue);
  if (!(finalValue == 22)) print(r"!expr : inverts the expression ");

  print("************* 6. Conditional Operators ***********");
  // Conditional Operator has IF-Else kind of situation

  print("******************** a. Ternary operator *****************");
  // Ternary operator - can also solve using IF-ELSE or Switch condition but it's long.
  int x = 100;
  var result = x % 2 == 0 ? "Even" : "Odd";
  print(result);

  print("******************** b. Null Aware Operators *****************");

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
