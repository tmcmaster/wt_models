import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapStringTo<T extends BaseModel<T>> with DslTransformerFrom<T, String> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapStringTo(this._dsl);

  @override
  T model(String dynamicMapString) => _dsl.jsonToModel(
        Dsl.jsonDecode(dynamicMapString) as JsonMap,
      );

  @override
  JsonMap jsonMap(String dynamicMapString) => Dsl.jsonDecode(dynamicMapString) as JsonMap;

  @override
  DynamicMap dynamicMap(String dynamicMapString) => jsonMap(dynamicMapString);

  @override
  ObjectMap objectMap(String dynamicMapString) => jsonMap(dynamicMapString);

  @override
  String jsonMapString(String dynamicMapString) => dynamicMapString;

  @override
  void jsonMapFile(String dynamicMapString, File file) => file.writeAsStringSync(dynamicMapString);

  @override
  CsvRow csvRow(String dynamicMapString) {
    return Dsl.jsonMapToCsvRow(
      Dsl.stringToJsonMap(dynamicMapString),
      _dsl.titles,
    );
  }

  @override
  String csvRowString(String dynamicMapString) => Dsl.csvEncode([
        csvRow(dynamicMapString),
      ]);

  @override
  void csvRowFile(String dynamicMapString, File file) {
    file.writeAsStringSync(
      csvRowString(dynamicMapString),
    );
  }
}
