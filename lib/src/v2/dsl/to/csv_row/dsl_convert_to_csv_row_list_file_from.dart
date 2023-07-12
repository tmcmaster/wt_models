import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_list_file_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToCsvRowListFileFrom<T extends BaseModel<T>>
    with DslTransformerListFileTo<T, void> {
  final Dsl<T> dsl;

  DslConvertToCsvRowListFileFrom(this.dsl);

  @override
  void csvRowList(List<CsvRow> csvRowList, File outputCsvRowListFile) =>
      dsl.convert.from.csvRowList.to.csvRowListFile(csvRowList, outputCsvRowListFile);

  @override
  void csvRowListFile(File csvRowListFile, File outputCsvRowListFile) =>
      dsl.convert.from.csvRowListFile.to.csvRowListFile(csvRowListFile, outputCsvRowListFile);

  @override
  void csvRowListString(String csvRowListString, File outputCsvRowListFile) =>
      dsl.convert.from.csvRowListString.to.csvRowListFile(csvRowListString, outputCsvRowListFile);

  @override
  void dynamicMapList(List<DynamicMap> dynamicMapList, File outputCsvRowListFile) =>
      dsl.convert.from.dynamicMapList.to.csvRowListFile(dynamicMapList, outputCsvRowListFile);

  @override
  void jsonMapList(List<JsonMap> jsonMapList, File outputCsvRowListFile) =>
      dsl.convert.from.jsonMapList.to.csvRowListFile(jsonMapList, outputCsvRowListFile);

  @override
  void jsonMapListFile(File jsonMapListFile, File outputCsvRowListFile) =>
      dsl.convert.from.jsonMapListFile.to.csvRowListFile(jsonMapListFile, outputCsvRowListFile);

  @override
  void jsonMapListString(String jsonMapListString, File outputCsvRowListFile) =>
      dsl.convert.from.jsonMapListString.to.csvRowListFile(jsonMapListString, outputCsvRowListFile);

  @override
  void modelList(List<T> modelList, File outputCsvRowListFile) =>
      dsl.convert.from.modelList.to.csvRowListFile(modelList, outputCsvRowListFile);

  @override
  void objectMapList(List<ObjectMap> objectMapList, File outputCsvRowListFile) =>
      dsl.convert.from.objectMapList.to.csvRowListFile(objectMapList, outputCsvRowListFile);
}
