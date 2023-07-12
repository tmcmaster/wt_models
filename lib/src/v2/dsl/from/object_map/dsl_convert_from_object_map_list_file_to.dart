import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_file_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapListFileTo<T extends BaseModel<T>> with DslTransformerListFileFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapListFileTo(this._dsl);

  @override
  String csvRowListString(File objectMapListFile) => Dsl.csvEncode(
        csvRowList(objectMapListFile),
      );

  @override
  void csvRowListFile(File objectMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        objectMapListFile.readAsStringSync(),
      );

  @override
  List<CsvRow> csvRowList(File objectMapListFile) {
    return jsonMapList(objectMapListFile)
        .map(
          (jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles),
        )
        .toList();
  }

  @override
  List<JsonMap> jsonMapList(File objectMapListFile) {
    final dynamicList = Dsl.jsonDecode(
      jsonMapListString(objectMapListFile),
    ) as List;
    return dynamicList.map((map) => map as JsonMap).toList();
  }

  @override
  String jsonMapListString(File objectMapListFile) => objectMapListFile.readAsStringSync();

  @override
  List<DynamicMap> dynamicMapList(File objectMapListFile) => jsonMapList(objectMapListFile);

  @override
  List<ObjectMap> objectMapList(File objectMapListFile) => jsonMapList(objectMapListFile);

  @override
  void jsonMapListFile(File objectMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListString(objectMapListFile),
      );

  @override
  List<T> modelList(File objectMapListFile) {
    final list = jsonMapList(objectMapListFile);
    return list
        .map(
          (jsonMap) => _dsl.jsonToModel(jsonMap),
        )
        .toList();
  }
}
