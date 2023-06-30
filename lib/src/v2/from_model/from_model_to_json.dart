import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';
import 'package:wt_models/src/v2/support/json_support_v2.dart';

mixin FromModelToJsonV2<M extends JsonSupportV2> {
  JsonMap jsonMapFromModel(M model) {
    return model.toJson();
  }

  String jsonMapStringFromModel(M model) {
    return toJsonString(jsonMapFromModel(model));
  }

  void jsonMapFileFromModel(M model, File file) {
    file.writeAsStringSync(jsonMapStringFromModel(model));
  }

  List<JsonMap> jsonMapListFromModelList(List<M> models) {
    return models.map((M m) => m.toJson()).toList();
  }

  String jsonMapListStringFromModelList(List<M> models) {
    return toJsonString(jsonMapListFromModelList(models));
  }

  void jsonMapListFileFromModelList(List<M> models, File file) {
    file.writeAsStringSync(jsonMapListStringFromModelList(models));
  }
}
