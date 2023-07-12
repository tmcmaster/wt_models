import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListTo<M, TO> {
  List<TO> modelList(List<M> model);
  List<TO> jsonMapList(List<JsonMap> jsonMap);
  List<TO> dynamicMapList(List<DynamicMap> dynamicMap);
  List<TO> objectMapList(List<ObjectMap> objectMap);
  List<TO> jsonMapListString(String jsonMapString);
  List<TO> jsonMapListFile(File jsonMapFile);
  List<TO> csvRowList(List<CsvRow> csvRow);
  List<TO> csvRowListString(String csvRowString);
  List<TO> csvRowListFile(File csvRowFile);
}
