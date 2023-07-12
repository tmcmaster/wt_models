import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_list_file_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToJsonMapListFileFrom<T extends BaseModel<T>>
    with DslTransformerListFileTo<T, void> {
  final Dsl<T> dsl;
  DslConvertToJsonMapListFileFrom(this.dsl);

  @override
  void csvRowList(List<CsvRow> csvRowList, File outputJsonMapListFile) =>
      dsl.convert.from.csvRowList.to.jsonMapListFile(csvRowList, outputJsonMapListFile);

  @override
  void csvRowListFile(File csvRowListFile, File outputJsonMapListFile) =>
      dsl.convert.from.csvRowListFile.to.jsonMapListFile(csvRowListFile, outputJsonMapListFile);

  @override
  void csvRowListString(String csvRowListString, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void jsonMapList(List<JsonMap> jsonMapList, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void dynamicMapList(List<DynamicMap> dynamicMapList, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void objectMapList(List<ObjectMap> objectMapList, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void jsonMapListFile(File jsonMapListFile, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void jsonMapListString(String jsonMapListString, File outputJsonMapListFile) =>
      Exception('Not supported yet.');

  @override
  void modelList(List<T> modelList, File outputJsonMapListFile) =>
      dsl.convert.from.modelList.to.jsonMapListFile(modelList, outputJsonMapListFile);
}
