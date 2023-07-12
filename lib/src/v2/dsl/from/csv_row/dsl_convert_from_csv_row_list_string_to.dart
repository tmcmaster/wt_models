import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_string_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowListStringTo<T extends BaseModel<T>>
    with DslTransformerListStringFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowListStringTo(this._dsl);

  @override
  List<CsvRow> csvRowList(String csvRowListString) => Dsl.csvDecode(csvRowListString).sublist(1);

  @override
  void csvRowListFile(String csvRowListString, File outputCsvRowFile) =>
      outputCsvRowFile.writeAsStringSync(csvRowListString);

  @override
  String csvRowListString(String csvRowListString) => csvRowListString;

  @override
  List<JsonMap> jsonMapList(String csvRowListString) => _dsl.convert.from.csvRowList.to.jsonMapList(
        csvRowList(csvRowListString),
      );

  @override
  List<DynamicMap> dynamicMapList(String csvRowListString) => jsonMapList(csvRowListString);

  @override
  List<ObjectMap> objectMapList(String csvRowListString) => jsonMapList(csvRowListString);

  @override
  String jsonMapListString(String csvRowListString) => Dsl.jsonEncode(
        jsonMapList(csvRowListString),
      );

  @override
  void jsonMapListFile(String csvRowListString, File outputJsonMapFile) =>
      outputJsonMapFile.writeAsStringSync(
        jsonMapListString(csvRowListString),
      );

  @override
  List<T> modelList(String csvRowListString) => jsonMapList(csvRowListString)
      .map(
        (jsonMap) => _dsl.jsonToModel(jsonMap),
      )
      .toList();
}
