import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListFileTo<T, TO> {
  TO modelList(List<T> modelList, File outputModelListFile);
  TO jsonMapList(List<JsonMap> jsonMapList, File outputJsonMapFile);
  TO dynamicMapList(List<DynamicMap> dynamicMapList, File outputDynamicMapFile);
  TO objectMapList(List<ObjectMap> objectMapList, File outputObjectMapFile);
  TO jsonMapListString(String jsonMapListString, File outputJsonMapListStringFile);
  TO jsonMapListFile(File jsonMapListFile, File outputJsonMapFile);
  TO csvRowList(List<CsvRow> csvRowList, File outputCsvRowListFile);
  TO csvRowListString(String csvRowListString, File outputCsvRowListStringFile);
  TO csvRowListFile(File csvRowListFile, File outputCsvListFile);
}
