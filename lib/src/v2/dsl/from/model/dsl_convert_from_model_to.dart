import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_transformer.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromModelTo<T extends BaseModelV2<T>> with DslTransformer<T, T> {
  final Dsl<T> _dsl;

  const DslConvertFromModelTo(this._dsl);

  @override
  T model(T from) => from;

  @override
  JsonMap jsonMap(T model) => model.toJson();

  @override
  String jsonMapString(T model) => Dsl.jsonEncode(jsonMap(model));

  @override
  void jsonMapFile(T model, File file) => file.writeAsStringSync(jsonMapString(model));

  @override
  CsvRow csvRow(T model) {
    final jsonMap = model.toJson();
    return _dsl.titles.map((title) => jsonMap[title] ?? '').toList();
  }

  @override
  String csvRowString(T model) => Dsl.csvEncode([csvRow(model)]);

  @override
  void csvRowFile(T model, File file) => file.writeAsStringSync(csvRowString(model));
}
