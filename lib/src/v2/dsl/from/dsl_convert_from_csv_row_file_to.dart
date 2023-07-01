import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowFileTo<T extends BaseModelV2<T>> with DslTransformer<T, File> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowFileTo(this._dsl);

  @override
  CsvRow csvRow(File csvRowFile) {
    // TODO: implement csvRow
    throw UnimplementedError();
  }

  @override
  void csvRowFile(File csvRowFile, File outputCsvRowFile) {}

  @override
  String csvRowString(File csvRowFile) {
    // TODO: implement csvRowString
    throw UnimplementedError();
  }

  @override
  JsonMap jsonMap(File csvRowFile) {
    // TODO: implement jsonMap
    throw UnimplementedError();
  }

  @override
  void jsonMapFile(File csvRowFile, File outputJsonMapFile) {
    // TODO: implement jsonMapFile
  }

  @override
  String jsonMapString(File csvRowFile) {
    // TODO: implement jsonMapString
    throw UnimplementedError();
  }

  @override
  T model(File csvRowFile) {
    // TODO: implement model
    throw UnimplementedError();
  }
}
