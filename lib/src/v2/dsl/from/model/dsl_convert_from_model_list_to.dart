import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_list_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromModelListTo<T extends BaseModel<T>> with DslTransformerListFrom<T, T> {
  final Dsl<T> _dsl;

  const DslConvertFromModelListTo(this._dsl);

  @override
  List<JsonMap> jsonMapList(List<T> from) => from
      .map(
        (model) => model.toJson(),
      )
      .toList();

  @override
  List<CsvRow> csvRowList(List<T> from) => jsonMapList(from)
      .map(
        (jsonMap) => Dsl.jsonMapToCsvRow(jsonMap, _dsl.titles),
      )
      .toList();

  @override
  String csvRowListString(List<T> from) => Dsl.csvEncode(
        csvRowList(from),
      );

  @override
  void csvRowListFile(List<T> from, File outputCsvRowFile) => outputCsvRowFile.writeAsStringSync(
        csvRowListString(from),
      );

  @override
  List<DynamicMap> dynamicMapList(List<T> from) => jsonMapList(from);

  @override
  List<ObjectMap> objectMapList(List<T> from) => jsonMapList(from);

  @override
  String jsonMapListString(List<T> from) => Dsl.jsonEncode(
        jsonMapList(from),
      );

  @override
  void jsonMapListFile(List<T> from, File outputJsonMapFile) => outputJsonMapFile.writeAsStringSync(
        jsonMapListString(from),
      );

  @override
  List<T> modelList(List<T> from) => from;
}
