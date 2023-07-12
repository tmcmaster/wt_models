import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapFileTo<T extends BaseModel<T>> with DslTransformerFrom<T, File> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapFileTo(this._dsl);

  @override
  void csvRowFile(File objectMapFile, File csvRowFile) {
    csvRowFile.writeAsStringSync(
      csvRowString(objectMapFile),
    );
  }

  @override
  String csvRowString(File objectMapFile) => Dsl.csvEncode([
        csvRow(objectMapFile),
      ]);

  @override
  CsvRow csvRow(File objectMapFile) => Dsl.jsonMapToCsvRow(
        jsonMap(objectMapFile),
        _dsl.titles,
      );

  @override
  JsonMap jsonMap(File objectMapFile) => Dsl.stringToJsonMap(
        jsonMapString(objectMapFile),
      );

  @override
  DynamicMap dynamicMap(File from) => jsonMap(from);

  @override
  ObjectMap objectMap(File from) => jsonMap(from);

  @override
  void jsonMapFile(File objectMapFile, File outputJsonMapFile) {}

  @override
  String jsonMapString(File objectMapFile) {
    return objectMapFile.readAsStringSync();
  }

  @override
  T model(File from) => _dsl.jsonToModel(
        jsonMap(from),
      );
}
