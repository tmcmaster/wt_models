import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapListTo<T extends BaseModel<T>>
    with DslTransformerListFrom<T, DynamicMap> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapListTo(this._dsl);

  @override
  List<T> modelList(List<DynamicMap> dynamicMapList) =>
      jsonMapList(dynamicMapList).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();

  @override
  List<CsvRow> csvRowList(List<DynamicMap> dynamicMapList) => jsonMapList(dynamicMapList)
      .map((jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles))
      .toList();

  @override
  void csvRowListFile(List<DynamicMap> dynamicMapList, File outputCsvRowListFile) =>
      outputCsvRowListFile.writeAsStringSync(
        csvRowListString(dynamicMapList),
      );

  @override
  String csvRowListString(List<DynamicMap> dynamicMapList) => Dsl.csvEncode(
        csvRowList(dynamicMapList),
      );

  @override
  List<DynamicMap> dynamicMapList(List<DynamicMap> dynamicMapList) => dynamicMapList;

  @override
  List<JsonMap> jsonMapList(List<DynamicMap> dynamicMapList) =>
      dynamicMapList.map((e) => Dsl.dynamicMapDecoder(e)).toList();

  @override
  void jsonMapListFile(List<DynamicMap> dynamicMapList, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListString(dynamicMapList),
      );

  @override
  String jsonMapListString(List<DynamicMap> dynamicMapList) => Dsl.jsonEncode(
        jsonMapList(dynamicMapList),
      );

  @override
  List<ObjectMap> objectMapList(List<DynamicMap> dynamicMapList) => dynamicMapList;
}
