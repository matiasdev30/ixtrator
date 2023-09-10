<a name="readme-top"></a>


<h1 align="center">[Abstract Class Code Generator for DART]-[Dart]-[FLutter]
<br />iXtrator</h1>

<!-- PROJECT LOGO -->
<br />
<div align="center">



  <p align="center">
    ixtrator is a straightforward tool for Dart developers. It takes your Dart classes and helps you generate clear abstract classes from them. This makes your code easier to understand and work with. It's a simple, no-fuss solution to a common problem.
    <br />
    <!-- Put the link for the documentation here -->
    <a href="https://pub.dev/documentation/ixtrator/latest/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <!-- Disable unused links with with comments -->
    <!--<a href="https://pub.dev/publishers/flutterando.com.br/packages">View Demo</a> -->
    <!-- The Report Bug and Request Feature should point to the issues page of the project, in this example we use the pull requests page because this is a github template -->
    <a href="https://github.com/flutterando/auto_injector/issues">Report Bug</a>
    ·
    <a href="https://github.com/flutterando/auto_injector/issues">Request Feature</a>
  </p>

<br>

<!--  SHIELDS  ---->


<!-- The shields here are an example of what could be used and are the most recommended, there are more below in the "some recomendations about shields" section. 
See the links in the example below, changing the parts after img.shields.io you can change the content of the shields. Alternatively, go to the website and generate new shields.  

[![Version](https://img.shields.io/github/v/release/flutterando/auto_injector?style=plastic)](https://pub.dev/packages/auto_injector)
[![Pub Points](https://img.shields.io/pub/points/auto_injector?label=pub%20points&style=plastic)](https://pub.dev/packages/auto_injector/score)
[![Flutterando Analysis](https://img.shields.io/badge/style-flutterando__analysis-blueviolet?style=plastic)](https://pub.dev/packages/flutterando_analysis/)

[![Pub Publisher](https://img.shields.io/pub/publisher/auto_injector?style=plastic)](https://pub.dev/publishers/flutterando.com.br/packages)



The ones used here are:
- Release version
- Pub Points
- style: Flutterando analysis
- publisher: Flutterando --->

[![Version](https://img.shields.io/github/v/release/flutterando/auto_injector?style=plastic)](https://pub.dev/packages/auto_injector)
[![Pub Points](https://img.shields.io/pub/points/auto_injector?label=pub%20points&style=plastic)](https://pub.dev/packages/auto_injector/score)
[![Flutterando Analysis](https://img.shields.io/badge/style-flutterando__analysis-blueviolet?style=plastic)](https://pub.dev/packages/flutterando_analysis/)

[![Pub Publisher](https://img.shields.io/pub/publisher/auto_injector?style=plastic)](https://pub.dev/publishers/flutterando.com.br/packages)
</div>

<!----
About Shields, some recommendations:
+-+
Build - GithubWorkflow ou Github Commit checks state
CodeCoverage - Codecov
Chat - Discord 
License - Github
Rating - Pub Likes, Pub Points and Pub Popularity (if still in early stages, we recommend only Pub Points since it's controllable)
Social - GitHub Forks, Github Org's Stars (if using Flutterando as the main org), YouTube Channel Subscribers (Again, using Flutterando, as set in the example)
--->

<br>

---
<!-- TABLE OF CONTENTS -->
<!-- Linked to every ## title below -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#sponsors">Sponsors</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#how-to-use">How to Use</a></li>
     <ol>
      <li><a href="#dispose-singleton">Dispose Singleton</a></li>
      <li><a href="#modularization">Modularization</a></li>
      <li><a href="#param-transform">Param Transform</a></li>
     </ol>
    <li><a href="#features">Features</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

---

<br>

<!-- ABOUT THE PROJECT -->
## About The Project
ixtrator is a simple package that simplifies extracting abstract classes in Dart projects. With its automated class structure generation, it generates the abstractions while only focusing on implementation, improving code organization, readability, and maintainability, making it an invaluable tool for Dart developers.


<i>This project is distributed under the MIT License. See `LICENSE.txt` for more information.
</i>



<!-- GETTING STARTED -->
## Getting Started

<!---- The description provided below was aimed to show how to install a pub.dev package, change it as you see fit for your project ---->


a) Add your_package as a dependency in your Pubspec.yaml:
 ```yaml
   dependencies:
     ixtrator: ^1.0.0
``` 

b) Create a build.yaml file in the root of your project with the following configuration:
```sh
targets:
  $default:
    builders:
      ixtrator|ixtratorBuilder:
        enabled: true
```

c) In your Dart class, apply the @GenerateClassStructure() decorator. For example:

```
@GenerateClassStructure()
class MyClass implements IMyClass {
  
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  // ... Other methods

}
```

d): Generate Abstract Classes
Run the following command to generate the abstract class structures:

```
    dart run build_runner build

```

ixtrator will generate the corresponding abstract class structure based on your class methods. Look for the generated .g.dart files in your project directory.

d): In the generated .g.dart files, you'll find the method signatures along with the result class. Copy the abstract class structure and apply it to your original class with the @override annotation. Also, implement the result class:


⚠️ Please note that ixtrator preserves the original method signatures. To correctly implement the generated abstract class, ensure that you add the @override annotation to each method in your concrete class after generating the files. ⚠️



```
abstract class IMyClass {
  Stream<String> myMethod(int param1, {String param2 = 'default'});
  Future<void> myM34(dynamic param1, {required dynamic param2});
  List<DateTime> dates();
  void simpleVoid();
}

class MyClass implements IMyClass {
  @override
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  @override
  Future<void> myM34(dynamic param1, {required dynamic param2}) async {}

  @override
  List<DateTime> dates() {
    return [];
  }

  @override
  void simpleVoid() {}
}


```

## How to Use


1): First, you apply the @GenerateClassStructure() annotation to your class. ixtrator will generate the abstract class structure with method signatures.

In the same directory as your Dart file, create a file with a .g.dart extension. This is where the generated code will be placed. For example, if your Dart file is named example.dart, your generated file could be named example.g.dart.

In your Dart file, use the part directive to specify the generated part file:


```
import 'package:ixtrator/ixtrator.dart';
part 'example.g.dart';

@GenerateClassStructure()
class MyClass implements IMyClass {
  
  @override
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  @override
  Future<void> myM34(param1, {required param2}) async {}

  @override
  List<DateTime> dates() {
    return [];
  }

  @override
  void simpleVoid() {}
}



```


## Features

- ✅ Automatic Abstract Class Generation: Ixtrator automates the process of creating abstract classes based on your concrete classes.
- ✅ Simplified Code Maintenance: With generated abstract classes, your codebase becomes more organized and easier to maintain.
- ✅ Enhanced Code Structure: It promotes adherence to best practices and clean code principles by separating interfaces from implementations.
- ✅ Annotations: It utilizes the @GenerateClassStructure annotation to identify which classes need abstract counterparts.
- ✅ Minimal Configuration: Ixtrator requires minimal configuration, making it easy to integrate into your Dart projects.

Right now this package has concluded all his intended features. If you have any suggestions or find something to report, see below how to contribute to it. 

<!---- 
We suggest, in case of the roadmap of features has been completed, to include the text below:

Right now this package has concluded all his intended features. If you have any suggestions or find something to report, see below how to contribute to it. 
---->


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing 

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the appropriate tag. 
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Remember to include a tag, and to follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) and [Semantic Versioning](https://semver.org/) when uploading your commit and/or creating the issue. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<br>


More example:

```
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_usage.dart';

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

part 'example_usage.g.dart';

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





```



