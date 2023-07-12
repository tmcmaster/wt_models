import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapTo<T extends BaseModel<T>> with DslTransformerFrom<T, ObjectMap> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapTo(this._dsl);

  @override
  T model(ObjectMap objectMap) => _dsl.jsonToModel(jsonMap(objectMap));

  @override
  JsonMap jsonMap(ObjectMap objectMap) =>
      {for (final e in objectMap.entries) e.key.toString(): e.value};

  @override
  DynamicMap dynamicMap(ObjectMap objectMap) => objectMap;

  @override
  ObjectMap objectMap(ObjectMap objectMap) => objectMap;

  @override
  String jsonMapString(ObjectMap objectMap) => Dsl.jsonEncode(jsonMap(objectMap));

  @override
  void jsonMapFile(ObjectMap objectMap, File file) =>
      file.writeAsStringSync(jsonMapString(objectMap));

  @override
  CsvRow csvRow(ObjectMap objectMap) => objectMap.values.toList();

  @override
  String csvRowString(ObjectMap objectMap) => Dsl.csvEncode([csvRow(objectMap)]);

  @override
  void csvRowFile(ObjectMap objectMap, File file) =>
      file.writeAsStringSync(csvRowString(objectMap));
}
