import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_string_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapListStringTo<T extends BaseModel<T>>
    with DslTransformerListStringFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapListStringTo(this._dsl);

  @override
  List<CsvRow> csvRowList(String jsonMapListString) => jsonMapList(jsonMapListString)
      .map((jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles))
      .toList();

  @override
  void csvRowListFile(String jsonMapListString, File outputListFile) =>
      outputListFile.writeAsStringSync(csvRowListString(jsonMapListString));

  @override
  String csvRowListString(String jsonMapListString) => Dsl.csvEncode(csvRowList(jsonMapListString));

  @override
  List<DynamicMap> dynamicMapList(String jsonMapListString) => jsonMapList(jsonMapListString);

  @override
  List<JsonMap> jsonMapList(String jsonMapListString) {
    final List<dynamic> jsonList = Dsl.jsonDecode(jsonMapListString) as List;
    return jsonList.whereType<JsonMap>().toList();
  }

  @override
  void jsonMapListFile(String jsonMapListString, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(jsonMapListString);

  @override
  String jsonMapListString(String jsonMapListString) => jsonMapListString;

  @override
  List<T> modelList(String jsonMapListString) =>
      jsonMapList(jsonMapListString).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();

  @override
  List<ObjectMap> objectMapList(String jsonMapListString) => jsonMapList(jsonMapListString);
}
