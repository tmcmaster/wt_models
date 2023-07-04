import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerTo<T, TO> {
  TO model(T model);
  TO jsonMap(JsonMap jsonMap);
  TO dynamicMap(DynamicMap dynamicMap);
  TO objectMap(ObjectMap objectMap);
  TO jsonMapString(String jsonMapString);
  TO jsonMapFile(File jsonMapFile);
  TO csvRow(CsvRow csvRow);
  TO csvRowString(String csvRowString);
  TO csvRowFile(File csvRowFile);
}
