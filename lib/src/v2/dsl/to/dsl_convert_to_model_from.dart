import 'dart:convert';
import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToModelFrom<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  DslConvertToModelFrom(this._dsl);
  T jsonMap(JsonMap jsonMap) => _dsl.jsonToModel(jsonMap);
  T string(String jsonMapString) => jsonMap(jsonDecode(jsonMapString) as JsonMap);
  T file(File file) => string(file.readAsStringSync());
}
