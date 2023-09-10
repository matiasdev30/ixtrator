export 'src/generete_class_structure.dart';
export 'src/ixtrator_generator.dart';

import 'package:build/build.dart';
import 'package:ixtrator/src/ixtrator_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder ixtratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([IxtratorGenerator()], "ixtrator");
