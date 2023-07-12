import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl_convert.dart';
import 'package:wt_models/src/v2/firebase_transformer.dart';
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

  static JsonMap dynamicMapDecoder(DynamicMap map) =>
      {for (final e in map.entries) e.key.toString(): e.value};
  static DynamicMap dynamicMapEncoder(JsonMap map) => map;

  static JsonMap objectMapDecoder(DynamicMap map) => dynamicMapDecoder(map);
  static DynamicMap objectMapEncoder(JsonMap map) => map;

  static JsonMap firebaseMapDecoder(Map<Object?, Object?> map) =>
      FirebaseTransformer.convertSnapshotMap(map);
  static JsonMap firebaseMapEncoder(JsonMap map) => map;

  static List firebaseListDecoder<T>(List list) => FirebaseTransformer.convertList(list);
  static List firebaseListEncoder(List list) => list;

  static void fileToString(File file) => file.readAsStringSync();

  static JsonMap stringToJsonMap(String jsonMapString) => jsonDecode(jsonMapString) as JsonMap;

  static List<CsvRow> stringToCsvRowList(String csvListString) {
    final csvRowList = csvDecode(csvListString);
    if (csvRowList.isEmpty) throw Exception('There were no records.');
    return csvRowList;
  }

  static CsvRow stringToCsvRow(String csvRowString) {
    final csvRowList = stringToCsvRowList(csvRowString).sublist(1);
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
