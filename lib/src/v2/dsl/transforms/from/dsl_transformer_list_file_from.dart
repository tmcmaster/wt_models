import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListFileFrom<T> {
  List<T> modelList(File inputListFile);
  List<JsonMap> jsonMapList(File inputListFile);
  List<DynamicMap> dynamicMapList(File inputListFile);
  List<ObjectMap> objectMapList(File inputListFile);
  String jsonMapListString(File inputListFile);
  void jsonMapListFile(File inputListFile, File outputJsonMapListFile);
  List<CsvRow> csvRowList(File inputListFile);
  String csvRowListString(File inputListFile);
  void csvRowListFile(File inputListFile, File outputCsvRowListFile);
}
