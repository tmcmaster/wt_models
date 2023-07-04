import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl_transformer_from.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvertFromCsvRowTo<T extends BaseModel<T>> with DslTransformerFrom<T, CsvRow> {
  final Dsl<T> _dsl;

  DslConvertFromCsvRowTo(this._dsl);

  @override
  CsvRow csvRow(CsvRow csvRow) => csvRow;

  @override
  void csvRowFile(CsvRow csvRow, File outputCsvRowFile) => outputCsvRowFile.writeAsStringSync(
        csvRowString(csvRow),
      );

  @override
  String csvRowString(CsvRow csvRow) => Dsl.csvEncode([
        _dsl.titles,
        csvRow,
      ]);

  @override
  JsonMap jsonMap(CsvRow csvRow) => Dsl.csvRowToJsonMap(csvRow, _dsl.titles);

  @override
  DynamicMap dynamicMap(CsvRow from) => jsonMap(from);

  @override
  ObjectMap objectMap(CsvRow from) => jsonMap(from);

  @override
  void jsonMapFile(CsvRow csvRow, File outputJsonMapFile) => outputJsonMapFile.writeAsStringSync(
        jsonMapString(csvRow),
      );

  @override
  String jsonMapString(CsvRow csvRow) => Dsl.jsonEncode(jsonMap(csvRow));

  @override
  T model(CsvRow csvRow) => _dsl.jsonToModel(jsonMap(csvRow));
}
