import 'package:build/build.dart';
import 'package:ixtrator/src/ixtrator_builder.dart';
import 'package:source_gen/source_gen.dart';

Builder ixtratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([IxtratorGenerator()], "ixtrator");
