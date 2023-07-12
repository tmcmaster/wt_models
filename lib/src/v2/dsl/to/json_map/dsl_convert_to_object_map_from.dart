import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/to/dsl_transformer_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertToObjectMapFrom<T extends BaseModel<T>> with DslTransformerTo<T, ObjectMap> {
  final Dsl<T> dsl;
  DslConvertToObjectMapFrom(this.dsl);

  @override
  ObjectMap csvRow(CsvRow csvRow) => dsl.convert.from.csvRow.to.jsonMap(csvRow);

  @override
  ObjectMap csvRowFile(File csvRowFile) => dsl.convert.from.csvRowFile.to.jsonMap(csvRowFile);

  @override
  ObjectMap csvRowString(String csvRowString) =>
      dsl.convert.from.csvRowString.to.jsonMap(csvRowString);

  @override
  ObjectMap jsonMap(JsonMap jsonMap) => dsl.convert.from.jsonMap.to.jsonMap(jsonMap);

  @override
  ObjectMap dynamicMap(DynamicMap dynamicMap) => dsl.convert.from.dynamicMap.to.jsonMap(dynamicMap);

  @override
  ObjectMap objectMap(ObjectMap objectMap) => dsl.convert.from.objectMap.to.jsonMap(objectMap);

  @override
  ObjectMap jsonMapFile(File jsonMapFile) => dsl.convert.from.jsonMapFile.to.jsonMap(jsonMapFile);

  @override
  ObjectMap jsonMapString(String jsonMapString) =>
      dsl.convert.from.jsonMapString.to.jsonMap(jsonMapString);

  @override
  ObjectMap model(T model) => dsl.convert.from.model.to.jsonMap(model);
}
