import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class Dsl<T extends BaseModel<T>> {
  final DslConvert<T> convert;
  final List<String> titles;
  final T Function(JsonMap jsonMao) jsonToModel;
  final T none;

  Dsl({
    required this.convert,
    required this.titles,
    required this.jsonToModel,
    required this.none,
  });

  static final jsonEncode = const JsonEncoder.withIndent('  ').convert;
  static final jsonDecode = const JsonDecoder().convert;
  static final csvEncode = const ListToCsvConverter(delimitAllFields: true, eol: '\n').convert;
  static final csvDecode = const CsvToListConverter(eol: '\n').convert;

  static void fileToString(File file) => file.readAsStringSync();

  static JsonMap stringToJsonMap(String jsonMapString) => jsonDecode(jsonMapString) as JsonMap;

  static List<CsvRow> stringToCsvRowList(String csvListString) {
    final csvRowList = csvDecode(csvListString);
    if (csvRowList.isEmpty) throw Exception('There were no records.');
    return csvRowList.sublist(1);
  }

  static CsvRow stringToCsvRow(String csvRowString) {
    final csvRowList = stringToCsvRowList(csvRowString);
    if (csvRowList.length != 1) {
      throw Exception('There was not exactly 1 record: ${csvRowList.length}');
    }
    return csvRowList.first;
  }

  static CsvRow jsonMapToCsvRow(JsonMap jsonMap, List<dynamic> titles) {
    return titles.map((title) => jsonMap[title].toString()).toList();
  }

  static JsonMap csvRowToJsonMap(CsvRow csvRow, List<String> titles) {
    return {for (int i = 0; i < titles.length; i++) titles[i]: csvRow[i]};
  }
}
