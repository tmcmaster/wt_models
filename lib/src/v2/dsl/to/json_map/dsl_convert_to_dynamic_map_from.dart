import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToDynamicMapFrom<T extends BaseModel<T>> with DslTransformerTo<T, JsonMap> {
  final Dsl<T> dsl;
  DslConvertToDynamicMapFrom(this.dsl);

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
  JsonMap dynamicMap(DynamicMap dynamicMap) => dsl.convert.from.dynamicMap.to.jsonMap(dynamicMap);

  @override
  JsonMap objectMap(ObjectMap objectMap) => dsl.convert.from.objectMap.to.jsonMap(objectMap);

  @override
  JsonMap jsonMapFile(File jsonMapFile) => dsl.convert.from.jsonMapFile.to.jsonMap(jsonMapFile);

  @override
  JsonMap jsonMapString(String jsonMapString) =>
      dsl.convert.from.jsonMapString.to.jsonMap(jsonMapString);

  @override
  JsonMap model(T model) => dsl.convert.from.model.to.jsonMap(model);
}
