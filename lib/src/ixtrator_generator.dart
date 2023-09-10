
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

import 'generete_class_structure.dart';


class IxtratorGenerator
    extends GeneratorForAnnotation<GenerateClassStructure> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is ClassElement) {
      final className = element.name;

      final generator = GenerateClassStructure(title: className);
      final classStructure = generator.generate(element);

      return classStructure;
    }
    return '';
  }
}
