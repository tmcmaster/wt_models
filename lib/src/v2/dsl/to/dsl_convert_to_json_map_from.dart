import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToJsonMapFrom<T extends BaseModel<T>> with DslTransformerTo<T, JsonMap> {
  final Dsl<T> dsl;
  DslConvertToJsonMapFrom(this.dsl);

  @override
  JsonMap csvRow(CsvRow csvRow) => dsl.convert.from.csvRow.to.jsonMap(csvRow);

  @override
  JsonMap csvRowFile(File csvRowFile) => dsl.convert.from.csvRowFile.to.jsonMap(csvRowFile);

  @override
  JsonMap csvRowString(String csvRowString) =>
      dsl.convert.from.csvRowString.to.jsonMap(csvRowString);

  @override
  JsonMap jsonMap(JsonMap jsonMap) => dsl.convert.from.jsonMap.to.jsonMap(jsonMap);

  @override
  JsonMap jsonMapFile(File jsonMapFile) => dsl.convert.from.jsonMapFile.to.jsonMap(jsonMapFile);

  @override
  JsonMap jsonMapString(String jsonMapString) =>
      dsl.convert.from.jsonMapString.to.jsonMap(jsonMapString);

  @override
  JsonMap model(T model) => dsl.convert.from.model.to.jsonMap(model);
}
