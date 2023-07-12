import 'dart:io';

import 'package:wt_models/src/v2/model_typedefs.dart';

mixin DslTransformerListFrom<T, F> {
  List<T> modelList(List<F> from);
  List<JsonMap> jsonMapList(List<F> from);
  List<DynamicMap> dynamicMapList(List<F> from);
  List<ObjectMap> objectMapList(List<F> from);
  String jsonMapListString(List<F> from);
  void jsonMapListFile(List<F> from, File outputJsonMapFile);
  List<CsvRow> csvRowList(List<F> from);
  String csvRowListString(List<F> from);
  void csvRowListFile(List<F> from, File outputCsvRowFile);
}
