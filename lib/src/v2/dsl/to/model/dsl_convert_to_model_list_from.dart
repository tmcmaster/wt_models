import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_list_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToModelListFrom<T extends BaseModel<T>> with DslTransformerListTo<T, T> {
  final Dsl<T> dsl;
  DslConvertToModelListFrom(this.dsl);

  @override
  List<T> csvRowList(List<CsvRow> csvRowList) =>
      dsl.convert.from.csvRowList.to.modelList(csvRowList);

  @override
  List<T> csvRowListFile(File csvRowFile) =>
      dsl.convert.from.csvRowListFile.to.modelList(csvRowFile);

  @override
  List<T> csvRowListString(String csvRowListString) =>
      dsl.convert.from.csvRowListString.to.modelList(csvRowListString);

  @override
  List<T> jsonMapList(List<JsonMap> jsonMapList) =>
      dsl.convert.from.jsonMapList.to.modelList(jsonMapList);

  @override
  List<T> dynamicMapList(List<DynamicMap> dynamicMapList) =>
      dsl.convert.from.dynamicMapList.to.modelList(dynamicMapList);

  @override
  List<T> objectMapList(List<ObjectMap> objectMapList) =>
      dsl.convert.from.objectMapList.to.modelList(objectMapList);

  @override
  List<T> jsonMapListFile(File jsonMapListFile) =>
      dsl.convert.from.jsonMapListFile.to.modelList(jsonMapListFile);

  @override
  List<T> jsonMapListString(String jsonMapListString) =>
      dsl.convert.from.jsonMapListString.to.modelList(jsonMapListString);

  @override
  List<T> modelList(List<T> modelList) => dsl.convert.from.modelList.to.modelList(modelList);
}
