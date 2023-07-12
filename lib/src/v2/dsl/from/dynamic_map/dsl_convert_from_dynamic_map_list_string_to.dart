import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_string_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapListStringTo<T extends BaseModel<T>>
    with DslTransformerListStringFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapListStringTo(this._dsl);

  @override
  List<CsvRow> csvRowList(String dynamicMapListString) => jsonMapList(dynamicMapListString)
      .map((jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles))
      .toList();

  @override
  void csvRowListFile(String dynamicMapListString, File outputListFile) =>
      outputListFile.writeAsStringSync(csvRowListString(dynamicMapListString));

  @override
  String csvRowListString(String dynamicMapListString) =>
      Dsl.csvEncode(csvRowList(dynamicMapListString));

  @override
  List<DynamicMap> dynamicMapList(String dynamicMapListString) => jsonMapList(dynamicMapListString);

  @override
  List<JsonMap> jsonMapList(String dynamicMapListString) {
    final List<dynamic> jsonList = Dsl.jsonDecode(dynamicMapListString) as List;
    return jsonList.whereType<JsonMap>().toList();
  }

  @override
  void jsonMapListFile(String dynamicMapListString, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(dynamicMapListString);

  @override
  String jsonMapListString(String dynamicMapListString) => dynamicMapListString;

  @override
  List<T> modelList(String dynamicMapListString) =>
      jsonMapList(dynamicMapListString).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();

  @override
  List<ObjectMap> objectMapList(String dynamicMapListString) => jsonMapList(dynamicMapListString);
}
