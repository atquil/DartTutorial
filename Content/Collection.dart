import 'dart:ffi';

void main(List<String> args) {
  // * 1. List

  List someList = [];
  print(someList.runtimeType);

  var someOtherList = [];
  print(someOtherList);

  List name = ['atul', 'anand'];
  print(name[0]);
  print(name.length);

  // compile time variable defination
  var nameDynamic = ['atul', 'anand'];
  print(nameDynamic.runtimeType);

  //for loop for list
  for (var name in name) {
    print(name);
  }

  // list of different types
  var unKnownType = ['abc', 2];
  print(unKnownType);

  //Defining list type : Static type variable with mutable value.
  List<String> stringList = ['abc', 'mi'];
  stringList[1] = "some thing else";
  stringList.forEach((element) {
    print(element);
  });

  //Defining list type : Static type variable with Constant value - no one can change value later in list
  List<double> numbers = const [33.2, 22.2];
  //if i do numbers[1] = 231.12 it will through error
  numbers.forEach((element) {
    print(element);
  });

  // * Spread Operator

  // What ? When we use one list value in other, both just point to main list, instead of storing value on it's own
  List<String> name1 = ['atul', 'anand'];

  var name2 =
      name1; // instead of storing the name1 variable it's also pointing to name1

  name1[1] =
      "himu"; // ideally the value of name2 should not change but we will see himu there

  name2.forEach((element) {
    print(element);
  });

  // ! To solve this problem , where one value is pointing to parent value we do this.
  // * Clone operator
  print("------- Clone Operator ----------");
  List<String> name3 = ['atul', 'anand'];

  var name4 = [...name3];
  name3[1] = "himu";

  // No himu will be printed
  name4.forEach((element) {
    print(element);
  });

  print("****************** SET OPERATIONS**************");
  // * 2. SET - Represented by {} - HashSet.

  Set someSetValue = {};
  print(someSetValue.runtimeType);

  var someSet = {};
  print(someSet.runtimeType);

  // Thus to define some Empty Set we will have do in this way

  Set<String> someSetWithEmpty = {};
  print(someSetWithEmpty.runtimeType);

  var someSetWithEmptyValues = <String>{};
  print(someSetWithEmptyValues.runtimeType);

  //Unique values
  var someSetWithValue = {'abc', 'efg', 'abc'};
  print("$someSetWithValue");
  print(someSetWithValue.runtimeType);

  print("******************** MAP (Distionaryt) Operation**************");
  // * 3. MAP - is also defined as Dictionary in other languages with key: value pair.

  var someMap = {
    'someKey': 'value',
    "otherKey": "otherValue",
    1: "somethingElse"
  };
  print(someMap.runtimeType);
  //print using key
  someMap.forEach((key, value) {
    print("Key is $key and value is $value");
  });
  // print one vlaue using key
  print(someMap[1]);

  // Empty Map
  var someEmptyMap = Map();
  print(someEmptyMap.runtimeType);
  print("$someEmptyMap");

  // add value in map
  someEmptyMap['addingKey'] = "addingvalue";
  print(someEmptyMap);
}
