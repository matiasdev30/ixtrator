
import 'package:source_gen/source_gen.dart';
import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';


class CodeGenerator
    extends GeneratorForAnnotation<GenerateClassStructure> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is ClassElement) {
      final className = element.name;

      final generator = GenerateClassStructure(className);
      final classStructure = generator.generate(element);

      return classStructure;
    }
    return '';
  }
}



class GenerateClassStructure {
  final String title;
  const GenerateClassStructure(this.title);

String generate(ClassElement classElement) {
  final className = classElement.name;
  final methods = classElement.methods.where((methodElement) =>
      methodElement.kind == ElementKind.CONSTRUCTOR ||
      (methodElement.kind == ElementKind.METHOD &&
          methodElement.metadata.isEmpty));

  StringBuffer classStructure = StringBuffer();

  // Use the provided title as the class name
  classStructure.writeln('abstract class Ix$title {');

  methods.forEach((methodElement) {
    // Get the method name
    String methodName = methodElement.name;

    // Check if it's a constructor
    bool isConstructor = methodElement.kind == ElementKind.CONSTRUCTOR;

    // Get the return type for methods (not constructors)
    String returnType = isConstructor
        ? ''
        : methodElement.returnType?.getDisplayString(withNullability: false) ??
            'dynamic';

    // Get the parameters and keywords
    List<String> parameters = [];
    methodElement.parameters.forEach((paramElement) {
      final paramName = paramElement.name;
      final paramType =
          paramElement.type?.getDisplayString(withNullability: false) ??
              'dynamic';
      parameters.add('$paramType $paramName');
    });

    classStructure.writeln('  ${isConstructor ? '' : '$returnType '}$methodName(${parameters.join(', ')});');
  });

  classStructure.writeln('}');
  return classStructure.toString();
}


}

@GenerateClassStructure("MyClassRepository")
class MyClass {
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  Future<void> myM34(param1, {required param2}) async {}

  List<DateTime> logos() {
    return [];
  }

  void simpleVoid() {}

  @override
  String toString() {
    return super.toString();
  }

  @override
  void asssi() {}
}



