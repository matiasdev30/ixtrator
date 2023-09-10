// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_class.dart';

// **************************************************************************
// IxtratorGenerator
// **************************************************************************

abstract class IExampleClass<T> {
  Future<int> multiply(int a, int b);
  Stream<int> countNumbers(int start, int end);
  void greet({required String name});
  void sayHello();
  Future<String> fetchMessage();
  Stream<String> generateMessages();
  Future<int> add(int a, int b);
  Future<int> subtract(int a, int b);
  Future<void> performOperations();
  Future<void> processUserData({required String username, required int age});
  Future<void> printNumbersInRange(int start, int end);
  Stream<int> generateNumbersInRange(int start, int end);
  Future<List<String>> processItems<T>(List<T> items, {String separator = ','});
  Stream<List<int>> generateRandomLists<T>(List<T> items);
  Future<Person> createPerson(String name, int age);
  Stream<Person> generatePeople();
}

abstract class IMyClass {
  Stream<String> myMethod(int param1, {String param2 = 'default'});
  Future<void> myM34(dynamic param1, {required dynamic param2});
  List<DateTime> logos();
  void simpleVoid();
}
