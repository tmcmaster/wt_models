import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_file_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapListFileTo<T extends BaseModel<T>>
    with DslTransformerListFileFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapListFileTo(this._dsl);

  @override
  String csvRowListString(File dynamicMapListFile) => Dsl.csvEncode(
        csvRowList(dynamicMapListFile),
      );

  @override
  void csvRowListFile(File dynamicMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        dynamicMapListFile.readAsStringSync(),
      );

  @override
  List<CsvRow> csvRowList(File dynamicMapListFile) {
    return jsonMapList(dynamicMapListFile)
        .map(
          (jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles),
        )
        .toList();
  }

  @override
  List<JsonMap> jsonMapList(File dynamicMapListFile) {
    final dynamicList = Dsl.jsonDecode(
      jsonMapListString(dynamicMapListFile),
    ) as List;
    return dynamicList.map((map) => map as JsonMap).toList();
  }

  @override
  String jsonMapListString(File dynamicMapListFile) => dynamicMapListFile.readAsStringSync();

  @override
  List<DynamicMap> dynamicMapList(File dynamicMapListFile) => jsonMapList(dynamicMapListFile);

  @override
  List<ObjectMap> objectMapList(File dynamicMapListFile) => jsonMapList(dynamicMapListFile);

  @override
  void jsonMapListFile(File dynamicMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListString(dynamicMapListFile),
      );

  @override
  List<T> modelList(File dynamicMapListFile) {
    final list = jsonMapList(dynamicMapListFile);
    return list
        .map(
          (jsonMap) => _dsl.jsonToModel(jsonMap),
        )
        .toList();
  }
}
