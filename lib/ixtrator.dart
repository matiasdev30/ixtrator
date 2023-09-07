
import 'package:build/build.dart';
import 'package:ixtrator/src/ixtrator_builder.dart';
import 'package:source_gen/source_gen.dart';

Builder codeGeneratorBuilder(BuilderOptions options) => SharedPartBuilder([CodeGenerator()], 'igen');


/*
class GenerateClassStructure<T> {
  final String title;
  const GenerateClassStructure(this.title);

  String generate(ClassMirror classMirror) {
    StringBuffer classStructure = StringBuffer();

    // Use the provided title as the class name
    classStructure.writeln('abstract class Ix$title {');

    // Get information about the methods of the class
    classMirror.declarations.forEach((symbol, declaration) {
      if (declaration is MethodMirror) {
        // Skip constructors
        if (declaration.isConstructor) {
          return;
        }

        // Skip methods with any annotations
        if (declaration.metadata.isNotEmpty) {
          return;
        }

        // Get the method name
        String methodName = MirrorSystem.getName(symbol);

        // Get the return type
        String returnType = getTypeName(declaration.returnType);

        // Get the parameters and keywords
        List<String> parameters = [];
        declaration.parameters.forEach((param) {
          parameters.add(
              '${getTypeName(param.type)} ${MirrorSystem.getName(param.simpleName)}');
        });

        classStructure
            .writeln('  $returnType $methodName(${parameters.join(', ')});');
      }
    });

    classStructure.writeln('}');
    return classStructure.toString();
  }

  generetStruct() {
    // Create an instance of the class
    var myInstance = T;

    // Get information about the class
    ClassMirror classMirror = reflectClass(T);

    // Use the decorator to generate and print the class structure
    final generator = GenerateClassStructure('MyGeneratedClass');
    String classStructure = generator.generate(classMirror);
    print(classStructure);
  }

  String getTypeName(TypeMirror typeMirror) {
    String typeName = MirrorSystem.getName(typeMirror.simpleName);

    if (typeMirror is ClassMirror) {
      List<String> typeArguments =
          typeMirror.typeArguments.map((arg) => getTypeName(arg)).toList();
      if (typeArguments.isNotEmpty) {
        typeName += '<${typeArguments.join(', ')}>';
      }
    }

    return typeName;
  }
}

@GenerateClassStructure<MyClass>("MyClassRepository")
class MyClass {
  Stream<String> myMethod(int param1, {String param2 = 'default'}) {
    return Stream.empty();
  }

  Future<void> myM34(param1, {required param2}) async {}

  List<Object> logos() {
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

void main() {
  final generator = GenerateClassStructure<MyClass>("");
  generator.generetStruct();
}
*/