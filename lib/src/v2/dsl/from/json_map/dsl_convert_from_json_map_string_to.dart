import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapStringTo<T extends BaseModel<T>> with DslTransformerFrom<T, String> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapStringTo(this._dsl);

  @override
  T model(String jsonMapString) => _dsl.jsonToModel(
        Dsl.jsonDecode(jsonMapString) as JsonMap,
      );

  @override
  JsonMap jsonMap(String jsonMapString) => Dsl.jsonDecode(jsonMapString) as JsonMap;

  @override
  DynamicMap dynamicMap(String from) => jsonMap(from);

  @override
  ObjectMap objectMap(String from) => jsonMap(from);

  @override
  String jsonMapString(String from) => from;

  @override
  void jsonMapFile(String jsonMapString, File file) => file.writeAsStringSync(jsonMapString);

  @override
  CsvRow csvRow(String jsonMapString) {
    return Dsl.jsonMapToCsvRow(
      Dsl.stringToJsonMap(jsonMapString),
      _dsl.titles,
    );
  }

  @override
  String csvRowString(String jsonMapString) => Dsl.csvEncode([
        csvRow(jsonMapString),
      ]);

  @override
  void csvRowFile(String jsonMapString, File file) {
    file.writeAsStringSync(
      csvRowString(jsonMapString),
    );
  }
}
