import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class JsonMapTransformer<T extends BaseModelV2> {
  final T Function(JsonMap jsonMao) jsonToModel;

  JsonMapTransformer({
    required this.jsonToModel,
  });

  T model(JsonMap jsonMap) {
    return jsonToModel(jsonMap);
  }

  String string(JsonMap jsonMap) {
    return toJsonString(jsonMap);
  }

  void file(JsonMap jsonMap, File file) {
    file.writeAsStringSync(string(jsonMap));
  }
}
