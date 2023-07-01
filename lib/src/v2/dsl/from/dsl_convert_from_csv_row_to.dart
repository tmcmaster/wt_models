import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowTo<T extends BaseModelV2<T>> with DslTransformer<T, CsvRow> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowTo(this._dsl);

  @override
  CsvRow csvRow(CsvRow csvRow) {
    // TODO: implement csvRow
    throw UnimplementedError();
  }

  @override
  void csvRowFile(CsvRow csvRow, File outputCsvRowFile) {
    // TODO: implement csvRowFile
  }

  @override
  String csvRowString(CsvRow csvRow) {
    // TODO: implement csvRowString
    throw UnimplementedError();
  }

  @override
  JsonMap jsonMap(CsvRow csvRow) {
    // TODO: implement jsonMap
    throw UnimplementedError();
  }

  @override
  void jsonMapFile(CsvRow csvRow, File outputJsonMapFile) {
    // TODO: implement jsonMapFile
  }

  @override
  String jsonMapString(CsvRow csvRow) {
    // TODO: implement jsonMapString
    throw UnimplementedError();
  }

  @override
  T model(CsvRow csvRow) {
    // TODO: implement model
    throw UnimplementedError();
  }
}
