/// Function : 
///   a. What? : Set of statements to perform specific Task. E.g. getCarDetails()
///   b. Use   : Reusable code, called from anywhere in program
///   c. vs Method? : It's called by the name associated with OBJECT e.g. Car.price()

/*   d. Syntax 
        return_type function_name ( parameters ) {
          // Body of function
          return value;
        }
*/
///   e. Dart always recommend to use type annotation for at-least public API's

void main(List<String> args) {
  print("******** 1. Sample Function ******");

  var squareWithSampleFunction = squareInt(10);
  print(
      "Calling the Square Function with a integer as parameter, which will return integer value of : $squareWithSampleFunction");

  print("******** 2. Lambda Function or Arrow Function ********");
  // => It's a shorthand way for a function, when you have only one expression.

  var squareWithLambdaFunction = squareUsingArrow(10);
  print("Calling square with lambda function:$squareWithLambdaFunction");

  print("******* 3. Anonymous Function or NameLess Function *************");
  //NameLess Function Or Anonymous function or Lambda Function (when it has only one expression)
  var someList = ['abc', 'efg', 'hij'];
  someList.forEach((element) {
    element += element;
    print(element);
  });

  // We can also store the value of anonymous function in other variable directly.
  var storeAnonymousToVariable = someList.map((e) => e.toUpperCase());
  print("See the list in upperCase: $storeAnonymousToVariable");

  print("********** 4. Recursive Dart Function ***************** ");
  // What ? Calling itself repeatedly till the result arrives
  print("Running recursive function {$factorial(5)}");

  print("******** 5. Parameters  ********");

  /// * Positional Argument :  When we call a function with the exact location/position of said parameter
  print(getNameAndAge("atul", 22));
  //print(getNameAndAge(33, "atul"));
  //This will throw error as , the position of int and name is interchanged.

  // * Positional Argument with Optional Value ([]) - Surround value with square brackets and make the type nullable using ?
  print(getNameAndAgePosOptional("dart"));

  // * Named Parameter : Named parameters are optional unless they’re explicitly marked as required. ({})

  print(getNameWithNamedArgument(age: 22, name: "atul"));
  print(getNameWithNamedArgument(
      age: 22)); // As it's always optional. OP : null is 22 old.

  // As the value can be null in named parameter, to deal with it we can use it in following way to give default value
  print(getNameWithNamedArgumentModifiedForNullValues(age: 221));
  print(getNameWithNamedArgumentModifiedForNullValues(name: "himu"));
  print(getNameWithNamedArgumentModifiedForNullValues(
      name: "himu atul", age: 2121121));

  // * Named Parameter with Required values
  // As by default named parameters are optional, we can either give default values or mark them required.
  print(getValueWithBestDefaultValue());

  // Here Name is required , but age is optional Parameter.
  print(getNamedWithRequiredValue(name: 'atul'));
}

// Function with int return type and parameter
int squareInt(int num) {
  return num * 2;
}

// * Using Arrow Function => to do the same thing
int squareUsingArrow(int num) => num * num;

factorial(number) {
  if (number <= 0) {
    // termination case
    return 1;
  } else {
    return (number * factorial(number - 1));
    // function invokes itself
  }
}

//For Positional Argument Function
String getNameAndAge(var name, var age) {
  return " $name is $age old";
}

// Positional + Optional : Here if age is null, then age will be fixed to 32322
dynamic getNameAndAgePosOptional(var name, [int? age]) =>
    name + (age ?? "32322");

// For Named Argument Function
dynamic getNameWithNamedArgument({var name, var age}) => " $name is $age old";

// Named Argument to better deal with Null values
dynamic getNameWithNamedArgumentModifiedForNullValues({var name, var age}) =>
    (name ?? "atul anand") + (age.toString() ?? "22");

// Named + Default value
dynamic getValueWithBestDefaultValue(
        {var name = "atul anand", var age = "31"}) =>
    name + age.toString();

// Named + Required
String getNamedWithRequiredValue({required String name, int? age}) {
  return name + age.toString();
}
