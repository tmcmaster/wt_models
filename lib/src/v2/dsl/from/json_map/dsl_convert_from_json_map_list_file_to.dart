import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_file_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapListFileTo<T extends BaseModel<T>> with DslTransformerListFileFrom<T> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapListFileTo(this._dsl);

  @override
  String csvRowListString(File jsonMapListFile) => Dsl.csvEncode(
        csvRowList(jsonMapListFile),
      );

  @override
  void csvRowListFile(File jsonMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListFile.readAsStringSync(),
      );

  @override
  List<CsvRow> csvRowList(File jsonMapListFile) {
    return [
      _dsl.titles,
      ...jsonMapList(jsonMapListFile).map(
        (jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles),
      ),
    ];
  }

  @override
  List<JsonMap> jsonMapList(File jsonMapListFile) {
    final dynamicList = Dsl.jsonDecode(
      jsonMapListString(jsonMapListFile),
    ) as List;
    return dynamicList.map((map) => map as JsonMap).toList();
  }

  @override
  String jsonMapListString(File jsonMapListFile) => jsonMapListFile.readAsStringSync();

  @override
  List<DynamicMap> dynamicMapList(File jsonMapListFile) => jsonMapList(jsonMapListFile);

  @override
  List<ObjectMap> objectMapList(File jsonMapListFile) => jsonMapList(jsonMapListFile);

  @override
  void jsonMapListFile(File jsonMapListFile, File outputJsonMapListFile) =>
      outputJsonMapListFile.writeAsStringSync(
        jsonMapListString(jsonMapListFile),
      );

  @override
  List<T> modelList(File jsonMapListFile) {
    final list = jsonMapList(jsonMapListFile);
    return list
        .map(
          (jsonMap) => _dsl.jsonToModel(jsonMap),
        )
        .toList();
  }
}
