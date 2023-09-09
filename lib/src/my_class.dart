import 'dart:html';
import 'ixtrator_builder.dart';
part 'my_class.g.dart';

@GenerateClassStructure()
class Person implements IPerson{
  String name;
  int age;

  Person(this.name, this.age);

  
  @override
  void sayHello() {
    print('Hello, my name is $name, and I am $age years old.');
  }
}