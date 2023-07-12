import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromDynamicMapFileTo<T extends BaseModel<T>> with DslTransformerFrom<T, File> {
  final Dsl<T> _dsl;

  DslConvertFromDynamicMapFileTo(this._dsl);

  @override
  void csvRowFile(File dynamicMapFile, File csvRowFile) {
    csvRowFile.writeAsStringSync(
      csvRowString(dynamicMapFile),
    );
  }

  @override
  String csvRowString(File dynamicMapFile) => Dsl.csvEncode([
        csvRow(dynamicMapFile),
      ]);

  @override
  CsvRow csvRow(File dynamicMapFile) => Dsl.jsonMapToCsvRow(
        jsonMap(dynamicMapFile),
        _dsl.titles,
      );

  @override
  JsonMap jsonMap(File dynamicMapFile) => Dsl.stringToJsonMap(
        jsonMapString(dynamicMapFile),
      );

  @override
  DynamicMap dynamicMap(File from) => jsonMap(from);

  @override
  ObjectMap objectMap(File from) => jsonMap(from);

  @override
  void jsonMapFile(File dynamicMapFile, File outputJsonMapFile) {}

  @override
  String jsonMapString(File dynamicMapFile) {
    return dynamicMapFile.readAsStringSync();
  }

  @override
  T model(File from) => _dsl.jsonToModel(
        jsonMap(from),
      );
}
