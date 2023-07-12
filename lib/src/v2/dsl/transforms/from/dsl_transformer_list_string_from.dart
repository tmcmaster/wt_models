import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListStringFrom<T> {
  List<T> modelList(String inputListString);
  List<JsonMap> jsonMapList(String inputListFile);
  List<DynamicMap> dynamicMapList(String inputListFile);
  List<ObjectMap> objectMapList(String inputListFile);
  String jsonMapListString(String inputListFile);
  void jsonMapListFile(String inputListFile, File outputJsonMapListFile);
  List<CsvRow> csvRowList(String inputListFile);
  String csvRowListString(String inputListFile);
  void csvRowListFile(String inputListFile, File outputListFile);
}
