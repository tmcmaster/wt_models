import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_file_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToJsonMapFileFrom<T extends BaseModel<T>> with DslTransformerFileTo<T, void> {
  final Dsl<T> dsl;
  DslConvertToJsonMapFileFrom(this.dsl);

  @override
  void csvRow(CsvRow csvRow, File outputFile) =>
      dsl.convert.from.csvRow.to.jsonMapFile(csvRow, outputFile);

  @override
  void csvRowFile(File csvRowFile, File outputFile) =>
      dsl.convert.from.csvRowFile.to.jsonMapFile(csvRowFile, outputFile);

  @override
  void csvRowString(String csvRowString, File outputFile) =>
      dsl.convert.from.csvRowString.to.jsonMapFile(csvRowString, outputFile);

  @override
  void jsonMap(JsonMap jsonMap, File outputFile) =>
      dsl.convert.from.jsonMap.to.jsonMapFile(jsonMap, outputFile);

  @override
  void dynamicMap(DynamicMap dynamicMap, File outputFile) {
    jsonMap({for (final e in dynamicMap.entries) e.key.toString(): e.value}, outputFile);
  }

  @override
  void objectMap(ObjectMap objectMap, File outputFile) {
    jsonMap({for (final e in objectMap.entries) e.key.toString(): e.value}, outputFile);
  }

  @override
  void jsonMapFile(File jsonMapFile, File outputFile) =>
      dsl.convert.from.jsonMapFile.to.jsonMapFile(jsonMapFile, outputFile);

  @override
  void jsonMapString(String jsonMapString, File outputFile) =>
      dsl.convert.from.jsonMapString.to.jsonMapFile(jsonMapString, outputFile);

  @override
  void model(T model, File outputFile) => dsl.convert.from.model.to.jsonMapFile(model, outputFile);
}
