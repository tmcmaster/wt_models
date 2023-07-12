import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRowListString Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRowListString', () {
    test('To ModelList', () {
      final modelList =
          Customer.convert.from.csvRowListString.to.modelList(testCustomer.csvRowListString);
      expect(modelList.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList =
          Customer.convert.from.csvRowListString.to.jsonMapList(testCustomer.csvRowListString);
      expect(jsonMapList.length, testCustomer.csvRowList.length);
    });
    test('To DynamicMapList', () {
      final dynamicMapList =
          Customer.convert.from.csvRowListString.to.dynamicMapList(testCustomer.csvRowListString);
      expect(dynamicMapList.length, testCustomer.csvRowList.length);
    });
    test('To ObjectMapList', () {
      final objectMapList =
          Customer.convert.from.csvRowListString.to.objectMapList(testCustomer.csvRowListString);
      expect(objectMapList.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapListString', () {
      final jsonMapListString = Customer.convert.from.csvRowListString.to
          .jsonMapListString(testCustomer.csvRowListString);
      expect(jsonMapListString.contains(testCustomer.model.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.csvRowListString.to
          .jsonMapListFile(testCustomer.csvRowListString, testCustomer.outputJsonMapListFile);
    });
    test('To CsvRowList', () {
      final csvRowList =
          Customer.convert.from.csvRowListString.to.csvRowList(testCustomer.csvRowListString);
      expect(csvRowList.length, testCustomer.csvRowList.length);
    });
    test('To CsvRowListString', () {
      final csvRowString =
          Customer.convert.from.csvRowListString.to.csvRowListString(testCustomer.csvRowListString);
      expect(csvRowString, testCustomer.csvRowListString);
    });
    test('To CsvRowListFile', () {
      Customer.convert.from.csvRowListString.to
          .csvRowListFile(testCustomer.csvRowListString, testCustomer.outputCsvRowListFile);
    });
  });
}
