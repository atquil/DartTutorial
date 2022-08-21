void main(List<String> args) {
  /// Control flow in dart can be categories into
  ///
  /// 1. Decision Making Statement
  ///    a. If .. Else Loop
  ///    b. Switch Case
  /// 2. Looping Statement : Dart looping statements are used to execute
  ///                        the block of code multiple-times for the given number of time until it matches the given condition. These statements are also called Iteration statement.
  ///    a. While and Do While
  ///    b. For Loop
  /// 3. Jump Statement : it transfers the execution to another statement from the current statement.
  ///    a. break and continue
  ///

  print("************* 1. If Loop ***********");

  var someNum = 20;
  if (someNum > 20) {
    print("In If");
  } else if (someNum == 20)
    print("In else If");
  else
    print("In else");

  print("************* 2. Switch and Case ***********");

  var condition = "SUCCESS";

  switch (condition) {
    case "SUCCESS":
      print("Success is printing");
      break;
    case "FAILURE":
      print("Failure is printed");
      break;
    default:
      print("If nothing from case then this will be printed");
  }

  /// Dart also supports empty case clauses, with fall-through.
  switch (condition) {
    case "SUCCESS": // This is empty, just like continue
    case "HAVING_SUCCESS":
      print("This will be printed as SUCCESS had no break");
      break;
    case "LITTLE_SUCCESS":
    default:
      print("If nothing from case then this will be printed");
  }

  print("************* 3. While and Do While ***********");

  //  while loop
  int num = 5;
  while (num < 7) {
    print(num);
    num++;
  }

  var conditionTrue = true;

  // If break is not given then a big problem
  while (conditionTrue) {
    print("Condition True");
    break;
  }

  // Do while loop
  do {
    print(num);
    num--;
  } while (num > 5);

  print("************* 4. For Loop ***********");

  for (int i = 0; i < 5; i++) {
    if (i % 2 == 0)
      print("Only Even no : $i");
    else
      continue;
  }

  // For Loop
  for (int i = 0; i < 5; i++) {
    print(i);
  }

  // For-In loop
  var x = [1, 2, 3, 4];

  for (var n in x) {
    print(n);
  }

  // For Each loop : Can use some extra stuff in the function.

  x.forEach((element) => print(" no is:$element"));

  for (var n in x) {
    if (n > 2) break;
    print("break statement $n");
  }

  print("************* 5. Labels ***********");

  ///A label is simply an identifier followed by a colon (:) that is applied to a statement or a block of code. A label can be used with break and continue to control the flow more precisely.

  print("Label with break");
  outerloop: // This is the label name

  for (var i = 0; i < 5; i++) {
    print("InnerLoop: ${i}");
    innerloop:
    for (var j = 0; j < 5; j++) {
      if (j > 3) break;

      // Quit the innermost loop
      if (i == 2) break innerloop;

      // Do the same thing
      if (i == 4) break outerloop;

      // Quit the outer loop
      print("Innerloop: ${j}");
    }
  }

  print("Label with continue:");
  outerloop: // This is the label name

  for (var i = 0; i < 3; i++) {
    print("Outer Loop:${i}");

    for (var j = 0; j < 5; j++) {
      if (j == 3) {
        continue outerloop;
      }
      print("Inner Loop:${j}");
    }
  }
}
