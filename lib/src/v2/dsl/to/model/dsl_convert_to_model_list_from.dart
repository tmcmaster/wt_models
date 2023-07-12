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
  List<T> csvRowListString(String csvRowListString) => throw Exception('Not supported yet.');

  @override
  List<T> jsonMapList(List<JsonMap> jsonMapList) => throw Exception('Not supported yet.');

  @override
  List<T> dynamicMapList(List<DynamicMap> dynamicMap) => throw Exception('Not supported yet.');

  @override
  List<T> objectMapList(List<ObjectMap> objectMap) => throw Exception('Not supported yet.');

  @override
  List<T> jsonMapListFile(File jsonMapListFile) =>
      dsl.convert.from.jsonMapListFile.to.modelList(jsonMapListFile);

  @override
  List<T> jsonMapListString(String jsonMapListString) => throw Exception('Not supported yet.');

  @override
  List<T> modelList(List<T> model) => dsl.convert.from.modelList.to.modelList(model);
}
