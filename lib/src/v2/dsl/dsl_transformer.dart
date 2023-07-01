import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformer<T, F> {
  T model(F from);
  JsonMap jsonMap(F from);
  String jsonMapString(F from);
  void jsonMapFile(F from, File outputJsonMapFile);
  CsvRow csvRow(F from);
  String csvRowString(F from);
  void csvRowFile(F from, File outputCsvRowFile);
}
