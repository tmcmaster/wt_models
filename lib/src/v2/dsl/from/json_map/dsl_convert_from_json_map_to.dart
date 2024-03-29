import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapTo<T extends BaseModel<T>> with DslTransformerFrom<T, JsonMap> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapTo(this._dsl);

  @override
  T model(JsonMap jsonMap) => _dsl.jsonToModel(jsonMap);

  @override
  JsonMap jsonMap(JsonMap jsonMap) => jsonMap;

  @override
  DynamicMap dynamicMap(JsonMap from) => jsonMap(from);

  @override
  ObjectMap objectMap(JsonMap from) => jsonMap(from);

  @override
  String jsonMapString(JsonMap jsonMap) => Dsl.jsonEncode(jsonMap);

  @override
  void jsonMapFile(JsonMap jsonMap, File file) => file.writeAsStringSync(jsonMapString(jsonMap));

  @override
  CsvRow csvRow(JsonMap jsonMap) => jsonMap.values.toList();

  @override
  String csvRowString(JsonMap jsonMap) => Dsl.csvEncode([csvRow(jsonMap)]);

  @override
  void csvRowFile(JsonMap jsonMap, File file) => file.writeAsStringSync(csvRowString(jsonMap));
}
