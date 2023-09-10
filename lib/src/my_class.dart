
import 'ixtrator_builder.dart';
part 'my_class.g.dart';

@GenerateClassStructure()
class ExampleClass implements IExampleClass{
  // Method 1: Future with return and arguments
  Future<int> multiply(int a, int b) async {
    await Future.delayed(Duration(seconds: 1));
    return a * b;
  }

  // Method 2: Stream with return and arguments
  
  Stream<int> countNumbers(int start, int end) async* {
    for (int i = start; i <= end; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      yield i;
    }
  }

  // Method 3: Void with required arguments
  
  void greet({required String name}) {
    print('Hello, $name!');
  }

  // Method 4: Void without arguments
  
  void sayHello() {
    print('Hello, world!');
  }

  // Method 5: Future with return and no arguments
  
  Future<String> fetchMessage() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Hello from the future!';
  }

  // Method 6: Stream with return and no arguments
  
  Stream<String> generateMessages() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield 'Message $i';
    }
  }

  // Method 7: Chaining Future methods
  
  Future<int> add(int a, int b) async {
    await Future.delayed(Duration(seconds: 1));
    return a + b;
  }

  
  Future<int> subtract(int a, int b) async {
    await Future.delayed(Duration(seconds: 1));
    return a - b;
  }

  
  Future<void> performOperations() async {
    final sum = await add(5, 3);
    final difference = await subtract(10, 4);
    print('Sum: $sum, Difference: $difference');
  }

  // Method 8: Asynchronous method with named arguments
  
  Future<void> processUserData({required String username, required int age}) async {
    await Future.delayed(Duration(seconds: 1));
    print('Processing user data: $username, $age years old');
  }

  // Method 9: Future method with async* for a range
  
  Future<void> printNumbersInRange(int start, int end) async {
    for (int i = start; i <= end; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      print(i);
    }
  }

  // Method 10: Stream with async* for a range
  
  Stream<int> generateNumbersInRange(int start, int end) async* {
    for (int i = start; i <= end; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      yield i;
    }
  }
  // Method 11: Future with generic types and lists of objects as parameters and return
  
  Future<List<String>> processItems<T>(List<T> items, {String separator = ','}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = items.map((item) => item.toString()).join(separator);
    return result.split(separator);
  }

  // Method 12: Stream with generic types and lists of objects as parameters and return
  Stream<List<int>> generateRandomLists<T>(List<T> items) async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield items.map((item) => i).toList();
    }
  }

  // Method 13: Future with objects as parameters and return
  
  Future<Person> createPerson(String name, int age) async {
    await Future.delayed(Duration(seconds: 1));
    return Person(name, age);
  }

  // Method 14: Stream with objects as parameters and return
  
  Stream<Person> generatePeople() async* {
    final people = [
      Person('Alice', 30),
      Person('Bob', 25),
      Person('Carol', 35),
    ];

    for (var person in people) {
      await Future.delayed(Duration(seconds: 1));
      yield person;
    }
  }
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}


@GenerateClassStructure()
class MyClass implements IMyClass{
  
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  
  Future<void> myM34(param1, {required param2}) async {}

  
  List<DateTime> logos() {
    return [];
  }

  
  void simpleVoid() {}

 
}

