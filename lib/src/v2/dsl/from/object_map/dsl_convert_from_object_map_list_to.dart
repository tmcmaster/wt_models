import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapListTo<T extends BaseModel<T>>
    with DslTransformerListFrom<T, ObjectMap> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapListTo(this._dsl);

  @override
  List<T> modelList(List<ObjectMap> objectMapList) =>
      jsonMapList(objectMapList).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();

  @override
  List<CsvRow> csvRowList(List<ObjectMap> objectMapList) => jsonMapList(objectMapList)
      .map((jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles))
      .toList();

  @override
  void csvRowListFile(List<ObjectMap> objectMapList, File outputCsvRowFile) =>
      outputCsvRowFile.writeAsStringSync(csvRowListString(objectMapList));

  @override
  String csvRowListString(List<ObjectMap> objectMapList) =>
      Dsl.csvEncode(csvRowList(objectMapList));

  @override
  List<DynamicMap> dynamicMapList(List<ObjectMap> objectMapList) => jsonMapList(objectMapList);

  @override
  List<JsonMap> jsonMapList(List<ObjectMap> objectMapList) => objectMapList
      .map(
        (objectMap) => Dsl.objectMapDecoder(objectMap),
      )
      .toList();

  @override
  void jsonMapListFile(List<ObjectMap> objectMapList, File outputJsonMapFile) =>
      outputJsonMapFile.writeAsStringSync(jsonMapListString(objectMapList));

  @override
  String jsonMapListString(List<ObjectMap> objectMapList) => Dsl.jsonEncode(jsonMapList);

  @override
  List<ObjectMap> objectMapList(List<ObjectMap> objectMapList) => objectMapList;
}
