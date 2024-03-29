import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerFileTo<T, TO> {
  TO model(T model, File outputFile);
  TO jsonMap(JsonMap jsonMap, File outputFile);
  TO dynamicMap(DynamicMap dynamicMap, File outputFile);
  TO objectMap(ObjectMap objectMap, File outputFile);
  TO jsonMapString(String jsonMapString, File outputFile);
  TO jsonMapFile(File jsonMapFile, File outputFile);
  TO csvRow(CsvRow csvRow, File outputFile);
  TO csvRowString(String csvRowString, File outputFile);
  TO csvRowFile(File csvRowFile, File outputFile);
}
