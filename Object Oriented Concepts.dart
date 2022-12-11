/*
 As Dart is an object- oriented programming language, it supports all the concepts of object-oriented programming.
 1. Class: Blueprint of the object. :<fields>, <getters/setters>, <constructor><functions>
 2. Object: We can access the class properties by creating object of class. The object has two
             characteristics i.e. state and behavior.
 3. Inheritance: Mixin-based inheritance means that although every class (except for the top class, Object?)
                  has exactly one superclass, a class body can be reused in multiple class hierarchies.
*/
void main() {
  print("*************** 1. Constructors *****************");

  /*
   There are three type of constructors in Dart
      a. Default Constructor or No Argument Constructor: 
                - Automatically create if didn't declared.
                - Dart compiler ignores the default constructor if we create a constructor with argument or no argument.

      b. Parameter Constructor: Pass parameter to constructor to initialize the instance variable
      c. Named Constructor[NEW]: To declare the multiple constructors in single class
      d. Constant constructor: Generate one instance of object (Cononical Instance) which can be used multiple times. 
            - Object that are compile time constants (never change), must have final variables.
            - Use: When we have multiple use of same value (e.g. padding)
                  It helps by pre-instantiating object at compile time
      e. Super Constructor :We can access both non-parameterized and parameterized constructor of superclass

    Use of this keyword:It indicates the current instance of the class, methods, or constructor aka, Indicates present class variable.
  */

  //Default
  Student defaultConstructor = Student();

  //Parameterized 
  Teacher teacher = Teacher("SomeNameOfTeacher", 22);
  TeacherWithThisKeyWord teacherWithThisKeyWord = TeacherWithThisKeyWord("SomeNameForThisKeyWord", 33);

  //[NEW] Named Constructor 
  Principle principle = Principle();
  Principle principleForNamedConstructor = Principle.isPresentInSchool(true); // Named Constructor isPresentInSchool to take one parameter


  //[NEW]Const Constructor 
  const String whereToKeepLogo = "Keep In Center";
  var whereToKeep = CreateMyConstClassToKeepLogoInCenter(whereToKeepLogo); 


  print("*************** 2. Instance Variable *****************");

  Person person1 = Person("Atul", "Address", 22);
  person1.showOutput();

  Person person2 = Person("Himu", "Another address");
  person2.showOutput();

  print("************** Class Property *******************");
  var somePerson = Person("name", "address");
  print(somePerson.name); // * It can be accessed using object

  // ! print(somePerson.gender) ? No as it's an Class property .
  print(Person
      .gender); //As it's Class Property it can only be accessed using Class.

  print("************* 4. Inheritance ****************** ");

  ///Inheritance :  It is defined as the process of deriving the properties and characteristics of another class
  ///             - The child class inherits functions and variables, or properties of parent class using the (extends) keyword
  //              - Type : Single, Multiple (not supported), Multilevel , Hierarchical Inheritance.
  //              - Parent class get inherited into Child class .
  //KeyWord: extends

  // Let's create a Address class , which will inherit the person details.
  var personDetails = Address("Anand", "india", 4545);
  personDetails.showOutput();
  personDetails.printAddress();
  personDetails.getParent();

  // * Explain Implicit super and Explicit super. https://www.javatpoint.com/dart-super-constructor
  /// When we declare the same method in the subclass,
  /// which is previously defined in the superclass is known as the method overriding
  print("************* 5. Polymorphism using Overriding ****************** ");

  Explanation child = Explanation();
  child.simpleMethodOverride();

  print("************* 6. Encapsulation using Abstraction ****************** ");
  // Why?  Suppose you want a method which must be implemented may be differently in all the similar class.
  ///      E.g. Abstract class Address, has few methods, which should be there in Employee, Contactor etc.
  /// About Abstract
  ///     - An abstract class can have an abstract method (method without implementation), or not.
  ///     - If there is at least one abstract method, then the class must be declared abstract
  ///     - The object of the abstract class cannot be created, but it can be (extended )
  ///     - An (abstract ) keyword is used to declare the abstract class.
  ///     - An abstract class can also include normal or concrete (method with the body) methods.
  ///     - All abstract methods of parent class must be implemented in the subclass : (Override parent)
  ///

  //Both Employee and ContractWorker extends Salary.
  Employee e = Employee();
  e.salaryPrint();
  e.someNonAbstractMethod();

  ContractWorker contractWorker = ContractWorker();
  contractWorker.salaryPrint();
  contractWorker.someNonAbstractMethod();

  print("************* 7. Interface ****************** ");

  /// Why? When we want to implement all the method of a class
  /// About Interface
  ///     - Using the interface, we can achieve multiple inheritance
  ///     - An interface class must provide the full implementation of
  ///       all the methods belong to the interfaces
  SomeClassImplementation someClassImplementation = SomeClassImplementation();
  someClassImplementation.someMethod();

  print(
      " **************** When to use Interface and when to use Abstract ***********");

  /// source : https://dzone.com/articles/when-to-use-abstract-class-and-intreface
  /// Abstract: Closely related class
  /// Interface : Unrelated class.
}

class CreateMyConstClassToKeepLogoInCenter {
  // Only Final fields as it can have only that.
  final String position;

  const CreateMyConstClassToKeepLogoInCenter(this.position);
}

class Principle {
  //Creating Default Constructor though not required.
  Principle() {
    print("Created Default constructor for named constructor example");
  }

  //Creating named constructor
  Principle.isPresentInSchool(bool isPresent) {
    print("Principle is {$isPresent ? present : absent}");
  }
}

class Student {
  Student() {
    print("I am inside default Constructor/ no argument constructor");
  }
}

class Teacher {
  String? name; // making a nullable variable or if we don't want to we can do String name = 0
  int? age;
  Teacher(name, age) {
    ///n the constructor body, the class variables (attributes) on the left side are assigned by the constructor parameters with the same name. When we create the instance of a class, the constructor automatically called the constructor and printed the result.

    ///The Dart compiler might get confused if there are a number of the same name parameters. The result is the compiler will create ambiguity.
    /// * use this keyword to tell about the assignment.
    name = name;
    age = age;
    print("Inside Parametrized constructor");
    print("The name is: ${name}");
    print("The age is: ${age}");
  }
}

// This keyword example.
class TeacherWithThisKeyWord {
  String? name;
  int? age;
  TeacherWithThisKeyWord(name, age) {
    this.name = name;
    this.age = age;
    print("Using this keyword in parameterized constructor. ");
    print("The name is: ${name}");
    print("The age is: ${age}");
  }
}


class Person {
  // * Object Property : Can be accessed by the object of the class.

  String name;
  int age;
  final address;

  Person(this.name, this.address, [this.age = 12]);

  void showOutput() =>
      print("[ParentClass] Person name is :$name and his/her age is : $age");

  // * Class Property -- Can be accessed only through class, not by it's object
  static const String gender = "Female";

  void someMethod() {
    print("[ParentClass] Child can access without super. ");
  }
}

// Using extends keyword for Inheritance.
class Address extends Person {
  int pinCode;

  //Address(super.name, super.address, this.pinCode);
  // We can also call , the parent class constructor with child class. using super()
  Address(super.name, super.address, this.pinCode) : super();

  showOutput() => print(
      " [ChildClass]Person name is :$name and his/her age is : $age and pinCode is : $pinCode");

  printAddress() =>
      print("[ChildClass] Name: $name , Address:$address , pinCode:$pinCode");

  //To get the Parent class method.
  void getParent() {
    /// NOTE: If method name is same in child and parent, then use super to indicate which one.
    ///The super can be used only if the subclass method overrides the superclass method.
    ///If it doesn't then we don't require using super keyword.
    super.showOutput();
    someMethod();
  }
}

class Parent {
  void simpleMethodOverride() {
    print("[SimpleMethodOverride] : Inside Parent");
  }
}

class Explanation extends Parent {
  // Explanation : The child class can have it's own implementation of parent method.
  void simpleMethodOverride() {
    print("[SimpleMethodOverride] : Inside Child");
  }
}

abstract class Salary {
  void
      salaryPrint(); // abstract method which should be implemented whenever it's called

  void someNonAbstractMethod() {
    print("I am in Salary");
  }
}

class Employee extends Salary {
  @override
  void salaryPrint() {
    // TODO: implement salaryPrint
    print("Abstract method salaryPrint for Employee");
  }
}

class ContractWorker extends Salary {
  @override
  void salaryPrint() {
    // TODO: implement salaryPrint
    print("Abstract method salaryPrint for Contractor Worker");
  }
}

class SomeClass {
  void someMethod() {
    print("This is a parent method");
  }
}

// Now defining the interface
class SomeClassImplementation implements SomeClass {
  @override
  void someMethod() {
    print("Implementing class");
  }
}
