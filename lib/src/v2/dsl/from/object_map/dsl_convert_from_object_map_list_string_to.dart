import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_string_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapListStringTo<T extends BaseModel<T>>
    with DslTransformerListStringFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapListStringTo(this._dsl);

  @override
  List<CsvRow> csvRowList(String objectMapListString) => jsonMapList(objectMapListString)
      .map((jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles))
      .toList();

  @override
  void csvRowListFile(String objectMapListString, File outputListFile) =>
      outputListFile.writeAsStringSync(csvRowListString(objectMapListString));

  @override
  String csvRowListString(String objectMapListString) =>
      Dsl.csvEncode(csvRowList(objectMapListString));

  @override
  List<DynamicMap> dynamicMapList(String objectMapListString) => jsonMapList(objectMapListString);

  @override
  List<JsonMap> jsonMapList(String objectMapListString) {
    final List<dynamic> jsonList = Dsl.jsonDecode(objectMapListString) as List;
    return jsonList.whereType<JsonMap>().toList();
  }

  @override
  void jsonMapListFile(String objectMapListString, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(objectMapListString);

  @override
  String jsonMapListString(String objectMapListString) => objectMapListString;

  @override
  List<T> modelList(String objectMapListString) =>
      jsonMapList(objectMapListString).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();

  @override
  List<ObjectMap> objectMapList(String objectMapListString) => jsonMapList(objectMapListString);
}
