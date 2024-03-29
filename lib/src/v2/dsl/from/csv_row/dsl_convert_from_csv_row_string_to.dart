import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowStringTo<T extends BaseModel<T>> with DslTransformerFrom<T, String> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowStringTo(this._dsl);

  @override
  CsvRow csvRow(String csvRowString) => Dsl.stringToCsvRow(csvRowString);

  @override
  void csvRowFile(String csvRowString, File outputCsvRowFile) =>
      outputCsvRowFile.writeAsStringSync(csvRowString);

  @override
  String csvRowString(String csvRowString) => csvRowString;

  @override
  JsonMap jsonMap(String csvRowString) => Dsl.csvRowToJsonMap(
        csvRow(csvRowString),
        _dsl.titles,
      );

  @override
  DynamicMap dynamicMap(String from) => jsonMap(from);

  @override
  ObjectMap objectMap(String from) => jsonMap(from);

  @override
  void jsonMapFile(String csvRowString, File outputJsonMapFile) {
    outputJsonMapFile.writeAsStringSync(
      jsonMapString(csvRowString),
    );
  }

  @override
  String jsonMapString(String csvRowString) => Dsl.jsonEncode(
        jsonMap(csvRowString),
      );

  @override
  T model(String csvRowString) => _dsl.jsonToModel(
        jsonMap(csvRowString),
      );
}
