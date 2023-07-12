import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapListTo<T extends BaseModel<T>> with DslTransformerListFrom<T, JsonMap> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapListTo(this._dsl);

  @override
  List<T> modelList(List<JsonMap> jsonMapList) =>
      jsonMapList.map((e) => _dsl.jsonToModel(e)).toList();

  @override
  List<CsvRow> csvRowList(List<JsonMap> jsonMapList) =>
      jsonMapList.map((e) => Dsl.jsonMapToCsvRow(e, _dsl.titles)).toList();

  @override
  void csvRowListFile(List<JsonMap> jsonMapList, File outputCsvRowFile) =>
      outputCsvRowFile.writeAsStringSync(csvRowListString(jsonMapList));

  @override
  String csvRowListString(List<JsonMap> jsonMapList) => Dsl.csvEncode(csvRowList(jsonMapList));

  @override
  List<DynamicMap> dynamicMapList(List<JsonMap> jsonMapList) => jsonMapList;

  @override
  List<JsonMap> jsonMapList(List<JsonMap> jsonMapList) => jsonMapList;

  @override
  void jsonMapListFile(List<JsonMap> jsonMapList, File outputJsonMapFile) =>
      outputJsonMapFile.writeAsStringSync(jsonMapListString(jsonMapList));

  @override
  String jsonMapListString(List<JsonMap> jsonMapList) => Dsl.jsonEncode(jsonMapList);

  @override
  List<ObjectMap> objectMapList(List<JsonMap> jsonMapList) => jsonMapList;
}
