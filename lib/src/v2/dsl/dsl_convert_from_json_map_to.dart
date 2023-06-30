import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapTo<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  DslConvertFromJsonMapTo(this._dsl);

  T model(JsonMap jsonMap) {
    return _dsl.jsonToModel(jsonMap);
  }

  String string(JsonMap jsonMap) {
    return toJsonString(jsonMap);
  }

  void file(JsonMap jsonMap, File file) {
    file.writeAsStringSync(string(jsonMap));
  }
}
