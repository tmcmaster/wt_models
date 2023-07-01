import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToJsonMapStringFrom<T extends BaseModel<T>> with DslTransformerTo<T, String> {
  final Dsl<T> dsl;
  DslConvertToJsonMapStringFrom(this.dsl);

  @override
  String csvRow(CsvRow csvRow) => dsl.convert.from.csvRow.to.jsonMapString(csvRow);

  @override
  String csvRowFile(File csvRowFile) => dsl.convert.from.csvRowFile.to.jsonMapString(csvRowFile);

  @override
  String csvRowString(String csvRowString) =>
      dsl.convert.from.csvRowString.to.jsonMapString(csvRowString);

  @override
  String jsonMap(JsonMap jsonMap) => dsl.convert.from.jsonMap.to.jsonMapString(jsonMap);

  @override
  String jsonMapFile(File jsonMapFile) =>
      dsl.convert.from.jsonMapFile.to.jsonMapString(jsonMapFile);

  @override
  String jsonMapString(String jsonMapString) =>
      dsl.convert.from.jsonMapString.to.jsonMapString(jsonMapString);

  @override
  String model(T model) => dsl.convert.from.model.to.jsonMapString(model);
}
