import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapTo<T extends BaseModelV2<T>> with DslTransformer<T, JsonMap> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapTo(this._dsl);

  @override
  T model(JsonMap jsonMap) => _dsl.jsonToModel(jsonMap);

  @override
  JsonMap jsonMap(JsonMap from) => from;

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
