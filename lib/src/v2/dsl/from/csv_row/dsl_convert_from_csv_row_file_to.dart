import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowFileTo<T extends BaseModel<T>> with DslTransformerFrom<T, File> {
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
  DynamicMap dynamicMap(File from) => jsonMap(from);

  @override
  ObjectMap objectMap(File from) => jsonMap(from);

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
