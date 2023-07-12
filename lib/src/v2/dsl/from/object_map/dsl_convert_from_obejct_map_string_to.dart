import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/from/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromObjectMapStringTo<T extends BaseModel<T>> with DslTransformerFrom<T, String> {
  final Dsl<T> _dsl;

  DslConvertFromObjectMapStringTo(this._dsl);

  @override
  T model(String obejctMapString) => _dsl.jsonToModel(
        Dsl.jsonDecode(obejctMapString) as JsonMap,
      );

  @override
  JsonMap jsonMap(String obejctMapString) => Dsl.jsonDecode(obejctMapString) as JsonMap;

  @override
  DynamicMap dynamicMap(String from) => jsonMap(from);

  @override
  ObjectMap objectMap(String from) => jsonMap(from);

  @override
  String jsonMapString(String from) => from;

  @override
  void jsonMapFile(String obejctMapString, File file) => file.writeAsStringSync(obejctMapString);

  @override
  CsvRow csvRow(String obejctMapString) {
    return Dsl.jsonMapToCsvRow(
      Dsl.stringToJsonMap(obejctMapString),
      _dsl.titles,
    );
  }

  @override
  String csvRowString(String obejctMapString) => Dsl.csvEncode([
        csvRow(obejctMapString),
      ]);

  @override
  void csvRowFile(String obejctMapString, File file) {
    file.writeAsStringSync(
      csvRowString(obejctMapString),
    );
  }
}
