import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowListTo<T extends BaseModel<T>> with DslTransformerListFrom<T, CsvRow> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowListTo(this._dsl);

  @override
  List<CsvRow> csvRowList(List<CsvRow> csvRowList) => csvRowList;

  @override
  void csvRowListFile(List<CsvRow> csvList, File outputCsvRowFile) {
    outputCsvRowFile.writeAsStringSync(csvRowListString(csvList));
  }

  @override
  String csvRowListString(List<CsvRow> csvRowList) {
    return Dsl.csvEncode([
      _dsl.titles,
      ...csvRowList,
    ]);
  }

  @override
  List<JsonMap> jsonMapList(List<CsvRow> csvList) {
    return csvList.map((csvRow) => Dsl.csvRowToJsonMap(csvRow, _dsl.titles)).toList();
  }

  @override
  List<DynamicMap> dynamicMapList(List<CsvRow> csvList) => jsonMapList(csvList);

  @override
  List<ObjectMap> objectMapList(List<CsvRow> csvList) => jsonMapList(csvList);

  @override
  void jsonMapListFile(List<CsvRow> csvList, File outputJsonMapFile) {
    outputJsonMapFile.writeAsStringSync(
      jsonMapListString(csvList),
    );
  }

  @override
  String jsonMapListString(List<CsvRow> csvList) {
    return Dsl.jsonEncode(jsonMapList(csvList));
  }

  @override
  List<T> modelList(List<CsvRow> csvRowList) {
    return jsonMapList(csvRowList).map((jsonMap) => _dsl.jsonToModel(jsonMap)).toList();
  }
}
