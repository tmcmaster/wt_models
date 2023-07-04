import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_list_file_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowListFileTo<T extends BaseModel<T>> with DslTransformerListFileFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowListFileTo(this._dsl);

  @override
  String csvRowListString(File cvsRowListFile) => cvsRowListFile.readAsStringSync();

  @override
  void csvRowListFile(File cvsRowListFile, File outputCsvRowListFile) =>
      outputCsvRowListFile.writeAsStringSync(
        cvsRowListFile.readAsStringSync(),
      );

  @override
  List<CsvRow> csvRowList(File cvsRowListFile) {
    return Dsl.csvDecode(
      csvRowListString(cvsRowListFile),
    ).sublist(1);
  }

  @override
  List<JsonMap> jsonMapList(File cvsRowListFile) {
    final list = csvRowList(cvsRowListFile);
    return list
        .map(
          (csvRow) => Dsl.csvRowToJsonMap(csvRow, _dsl.titles),
        )
        .toList();
  }

  @override
  String jsonMapListString(File cvsRowListFile) => Dsl.jsonEncode(
        jsonMapList(cvsRowListFile),
      );

  @override
  List<DynamicMap> dynamicMapList(File cvsRowListFile) => jsonMapList(cvsRowListFile);

  @override
  List<ObjectMap> objectMapList(File cvsRowListFile) => jsonMapList(cvsRowListFile);

  @override
  void jsonMapListFile(File cvsRowListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListString(cvsRowListFile),
      );

  @override
  List<T> modelList(File cvsRowListFile) {
    final list = jsonMapList(cvsRowListFile);
    return list
        .map(
          (jsonMap) => _dsl.jsonToModel(jsonMap),
        )
        .toList();
  }
}
