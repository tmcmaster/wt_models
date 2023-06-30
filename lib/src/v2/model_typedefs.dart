import 'dart:convert';

import 'package:csv/csv.dart';

typedef JsonMap = Map<String, dynamic>;
typedef DynamicMap = Map<dynamic, dynamic>;
typedef ObjectMap = Map<Object?, Object?>;
typedef CsvRow = List<dynamic>;

final toJsonString = const JsonEncoder.withIndent('  ').convert;
final fromJsonString = const JsonDecoder().convert;
final toCsvString = const ListToCsvConverter(delimitAllFields: true).convert;
final fromCsvString = const CsvToListConverter(eol: '\n').convert;
