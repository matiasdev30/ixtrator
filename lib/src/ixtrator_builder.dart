
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';


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

class GenerateClassStructure {
  final String title;

  // Modify the constructor to accept the class name
  const GenerateClassStructure({this.title = ""});

String generate(ClassElement classElement) {
  final methods = classElement.methods.where((methodElement) =>
      methodElement.kind == ElementKind.CONSTRUCTOR ||
      (methodElement.kind == ElementKind.METHOD &&
          methodElement.metadata.isEmpty));

  final typeParameters = classElement.typeParameters;
  final hasGenerics = typeParameters.isNotEmpty;
  final genericType = hasGenerics
      ? '<${typeParameters.map((tp) => tp.name).join(', ')}>'
      : '';

  StringBuffer classStructure = StringBuffer();

  // Use the provided title as the class name
  var className = '${title}${hasGenerics ? genericType : ''}';
  for (var methodElement in methods) {
  if (methodElement.typeParameters.isNotEmpty) {
    className += "<T>";
    break;
  }
  }


  classStructure.writeln(
      'abstract class I$className {');

  for (var methodElement in methods) {
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
    List<String> namedParameters = [];

    for (var paramElement in methodElement.parameters) {
      final paramName = paramElement.name;
      final paramType = paramElement.type.getDisplayString(withNullability: false);
      String paramDetails = '$paramType $paramName';

      // Check for default values
      if (paramElement.defaultValueCode != null) {
        paramDetails = '$paramDetails = ${paramElement.defaultValueCode}';
      }

      // Check for named parameters and add 'required' if necessary
      if (paramElement.isNamed) {
        if (paramElement.isRequiredNamed) {
          paramDetails = 'required $paramDetails';
        }
        namedParameters.add(paramDetails);
      } else {
        parameters.add(paramDetails);
      }
    }

    if (namedParameters.isNotEmpty) {
      parameters.add('{${namedParameters.join(', ')}}');
    }

    // Check if the method has generic parameters and add them
    if (methodElement.typeParameters.isNotEmpty) {
      methodName = '$methodName<${methodElement.typeParameters.map((tp) => tp.name).join(', ')}>';
    }

    classStructure.writeln(
        '  ${isConstructor ? '' : '$returnType '}$methodName(${parameters.join(', ')});');
  }
  

  classStructure.writeln('}');
  return classStructure.toString();
}


}

