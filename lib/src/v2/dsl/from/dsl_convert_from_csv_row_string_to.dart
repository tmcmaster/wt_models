import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowStringTo<T extends BaseModelV2<T>> with DslTransformer<T, String> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowStringTo(this._dsl);

  @override
  CsvRow csvRow(String csvRowString) {
    // TODO: implement csvRow
    throw UnimplementedError();
  }

  @override
  void csvRowFile(String csvRowString, File outputCsvRowFile) {
    // TODO: implement csvRowFile
  }

  @override
  String csvRowString(String csvRowString) {
    // TODO: implement csvRowString
    throw UnimplementedError();
  }

  @override
  JsonMap jsonMap(String csvRowString) {
    // TODO: implement jsonMap
    throw UnimplementedError();
  }

  @override
  void jsonMapFile(String csvRowString, File outputJsonMapFile) {
    // TODO: implement jsonMapFile
  }

  @override
  String jsonMapString(String csvRowString) {
    // TODO: implement jsonMapString
    throw UnimplementedError();
  }

  @override
  T model(String csvRowString) {
    // TODO: implement model
    throw UnimplementedError();
  }
}
