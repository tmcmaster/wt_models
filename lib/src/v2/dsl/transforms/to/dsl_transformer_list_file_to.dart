import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListFileTo<T, TO> {
  TO modelList(List<T> modelList, File outputFile);
  TO jsonMapList(List<JsonMap> jsonMap, File outputFile);
  TO dynamicMapList(List<DynamicMap> dynamicMap, File outputFile);
  TO objectMapList(List<ObjectMap> objectMap, File outputFile);
  TO jsonMapListString(String jsonMapString, File outputFile);
  TO jsonMapListFile(File jsonMapFile, File outputFile);
  TO csvRowList(List<CsvRow> csvRow, File outputFile);
  TO csvRowListString(String csvRowString, File outputFile);
  TO csvRowListFile(File csvRowFile, File outputFile);
}
