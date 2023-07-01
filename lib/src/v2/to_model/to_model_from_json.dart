import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

mixin ToModelFromJsonV2<T extends BaseModelV2> {
  T Function(JsonMap jsonMao) get jsonToModel;

  T jsonMapToModel(JsonMap jsonMap) {
    return jsonToModel(jsonMap);
  }

  T jsonMapDynamicToModel(Map<dynamic, dynamic> dynamicMap) {
    final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(dynamicMap);
    return jsonMapToModel(jsonMap);
  }

  T jsonMapStringToModel(String jsonMapString) {
    return jsonMapToModel(Dsl.jsonDecode(jsonMapString) as JsonMap);
  }

  T jsonMapFileToModel(File file) {
    return jsonMapStringToModel(file.readAsStringSync());
  }

  List<T> jsonMapListToModelList(List<JsonMap> jsonMapList) {
    return jsonMapList.map((jsonMap) => jsonMapToModel(jsonMap)).toList();
  }

  List<T> jsonMapListString(String jsonMapListString) {
    final List<JsonMap> jsonMapList = Dsl.jsonDecode(jsonMapListString) as List<JsonMap>;
    return jsonMapListToModelList(jsonMapList);
  }

  List<T> jsonMapListFileToModel(File file) {
    return jsonMapListString(file.readAsStringSync());
  }
}
