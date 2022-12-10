/*
Function : 
   a. What? : Set of statements to perform specific Task. E.g. getCarDetails()
   b. Use   : Standalone Reusable code, called from anywhere in program
   c. vs Method? : It's called by the name associated with OBJECT e.g. Car.price()
   d. Syntax 
        return_type function_name ( parameters ) {
          // Body of function
          return value;
        }

    e. Dart always recommend to use type annotation for at-least public API's
*/

void main() {
  print("******** 1. Sample Function ******");
  int squareInt(int num) =>  num * num;
  var squareWithSampleFunction = squareInt(10);

  print("[Simple Function]Square Value of 10 $squareWithSampleFunction");

  print("******** 2. Lambda Function or Arrow Function ********");

  int squareUsingArrow(int num) => num * num;
  var squareWithLambdaFunction = squareUsingArrow(10);

  print("[Lambda Function]Square of 10:$squareWithLambdaFunction");

  print("******* 3. Anonymous Function or NameLess Function *************");

  var someList = ['abc', 'efg', 'hij'];
  someList.forEach((element) {
    element += element;
    print(element);
  });

  // We can also store the value of anonymous function in other variable directly.
  var storeAnonymousToVariable = someList.map((e) => e.toUpperCase());
  print("See the list in upperCase: $storeAnonymousToVariable");

  print(
      "********** 4. Recursive Function: Calling itself till condition satisfy ***************** ");

factorial(number) => number <=0 ?  1: (number * factorial(number-1));
  print("Running recursive function {$factorial(5)}");

  print("******** 5.[NEW] Parameters : Positional, Positional with Optional, Named , Named with default , Named with required ********");

  //[Positional] : Calling a function with exact location/position.
  String getNameAndAge(var name, var age) => " $name is $age old"; //positional
  print(getNameAndAge("atul", 22)); // ! print(getNameAndAge(33, "atul"));

  //[Positional + Optional]: When some or all values are optional for a function
  dynamic getNameAndAgePosOptional(var name, [int? age]) =>
      name + (age ?? "32322"); // pos + optional
  print(getNameAndAgePosOptional("dart")); // Optional age

  //[Named]: Calling parameter by names using {}, and are optional unless explicitly marked required
  dynamic getNameWithNamedArgument({var name, var age}) => " $name is $age old";
  print(getNameWithNamedArgument(age: 22, name: "atul"));
  print(getNameWithNamedArgument(age: 22));

  //[Named + Default if null]: Calling parameter by using {}, but has a default value if not provided while calling the function 
  dynamic getValueWithBestDefaultValue(
          {var name = "atul anand", var age = "31"}) =>
      name + age.toString();
  print(getValueWithBestDefaultValue());

  //[Named + Required], When we can enjoy both , freeness of named parameter and boundness of required parameter in a function 
  String getNamedWithRequiredValue({required String name, int? age}) => name + age.toString();
  print(getNamedWithRequiredValue(name: 'atul'));
}
