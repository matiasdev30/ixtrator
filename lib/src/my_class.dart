import 'dart:html';
import 'ixtrator_builder.dart';
part 'my_class.g.dart';

@GenerateClassStructure("MyClassRepository")
class Person implements {
  String name;
  int age;

  Person(this.name, this.age);

  
  void sayHello() {
    print('Hello, my name is $name, and I am $age years old.');
  }
}