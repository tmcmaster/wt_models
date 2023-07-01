import 'dart:convert';
import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToJsonMapFrom<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  DslConvertToJsonMapFrom(this._dsl);
  JsonMap model(T model) {
    return model.toJson();
  }

  JsonMap string(String jsonMapString) {
    return jsonDecode(jsonMapString) as JsonMap;
  }

  JsonMap file(File file) {
    return string(file.readAsStringSync());
  }
}
