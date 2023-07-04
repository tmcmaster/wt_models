import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapFileTo<T extends BaseModel<T>> with DslTransformerFrom<T, File> {
  final Dsl<T> _dsl;

  DslConvertFromJsonMapFileTo(this._dsl);

  @override
  void csvRowFile(File jsonMapFile, File csvRowFile) {
    csvRowFile.writeAsStringSync(
      csvRowString(jsonMapFile),
    );
  }

  @override
  String csvRowString(File jsonMapFile) => Dsl.csvEncode([
        csvRow(jsonMapFile),
      ]);

  @override
  CsvRow csvRow(File jsonMapFile) => Dsl.jsonMapToCsvRow(
        jsonMap(jsonMapFile),
        _dsl.titles,
      );

  @override
  JsonMap jsonMap(File jsonMapFile) => Dsl.stringToJsonMap(
        jsonMapString(jsonMapFile),
      );

  @override
  DynamicMap dynamicMap(File from) => jsonMap(from);

  @override
  ObjectMap objectMap(File from) => jsonMap(from);

  @override
  void jsonMapFile(File jsonMapFile, File outputJsonMapFile) {}

  @override
  String jsonMapString(File jsonMapFile) {
    return jsonMapFile.readAsStringSync();
  }

  @override
  T model(File from) => _dsl.jsonToModel(
        jsonMap(from),
      );
}
