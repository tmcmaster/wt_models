import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromJsonMapFileTo<T extends BaseModelV2<T>> with DslTransformer<T, File> {
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
