import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToModelFrom<T extends BaseModelV2<T>> with DslTransformerTo<T, T> {
  final Dsl<T> dsl;
  DslConvertToModelFrom(this.dsl);

  @override
  T csvRow(CsvRow csvRow) => dsl.convert.from.csvRow.to.model(csvRow);

  @override
  T csvRowFile(File csvRowFile) => dsl.convert.from.csvRowFile.to.model(csvRowFile);

  @override
  T csvRowString(String csvRowString) => dsl.convert.from.csvRowString.to.model(csvRowString);

  @override
  T jsonMap(JsonMap jsonMap) => dsl.convert.from.jsonMap.to.model(jsonMap);

  @override
  T jsonMapFile(File jsonMapFile) => dsl.convert.from.jsonMapFile.to.model(jsonMapFile);

  @override
  T jsonMapString(String jsonMapString) => dsl.convert.from.jsonMapString.to.model(jsonMapString);

  @override
  T model(T model) => dsl.convert.from.model.to.model(model);
}
