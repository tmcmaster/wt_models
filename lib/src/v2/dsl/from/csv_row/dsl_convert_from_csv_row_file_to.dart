import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowFileTo<T extends BaseModelV2<T>> with DslTransformer<T, File> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowFileTo(this._dsl);

  @override
  CsvRow csvRow(File csvRowFile) => Dsl.stringToCsvRow(
        csvRowString(csvRowFile),
      );

  @override
  void csvRowFile(File csvRowFile, File outputCsvRowFile) {}

  @override
  String csvRowString(File csvRowFile) => csvRowFile.readAsStringSync();

  @override
  JsonMap jsonMap(File csvRowFile) => Dsl.csvRowToJsonMap(
        csvRow(csvRowFile),
        _dsl.titles,
      );

  @override
  void jsonMapFile(File csvRowFile, File outputJsonMapFile) {
    outputJsonMapFile.writeAsStringSync(
      jsonMapString(csvRowFile),
    );
  }

  @override
  String jsonMapString(File csvRowFile) => Dsl.jsonEncode(
        jsonMap(csvRowFile),
      );

  @override
  T model(File csvRowFile) => _dsl.jsonToModel(
        jsonMap(csvRowFile),
      );
}
