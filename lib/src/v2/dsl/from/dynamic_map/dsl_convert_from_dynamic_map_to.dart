import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapTo<T extends BaseModel<T>> with DslTransformerFrom<T, DynamicMap> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapTo(this._dsl);

  @override
  T model(DynamicMap dynamicMap) => _dsl.jsonToModel(jsonMap(dynamicMap));

  @override
  JsonMap jsonMap(DynamicMap dynamicMap) =>
      {for (final e in dynamicMap.entries) e.key.toString(): e.value};

  @override
  DynamicMap dynamicMap(DynamicMap dynamicMap) => dynamicMap;

  @override
  ObjectMap objectMap(DynamicMap dynamicMap) => dynamicMap;

  @override
  String jsonMapString(DynamicMap dynamicMap) => Dsl.jsonEncode(jsonMap(dynamicMap));

  @override
  void jsonMapFile(DynamicMap dynamicMap, File file) =>
      file.writeAsStringSync(jsonMapString(dynamicMap));

  @override
  CsvRow csvRow(DynamicMap dynamicMap) => dynamicMap.values.toList();

  @override
  String csvRowString(DynamicMap dynamicMap) => Dsl.csvEncode([csvRow(dynamicMap)]);

  @override
  void csvRowFile(DynamicMap dynamicMap, File file) =>
      file.writeAsStringSync(csvRowString(dynamicMap));
}
