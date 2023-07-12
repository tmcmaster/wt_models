import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRow Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRowList', () {
    test('To ModelList', () {
      final modelList = Customer.convert.from.csvRowList.to.modelList(testCustomer.csvRowList);
      expect(modelList.length, testCustomer.modelList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList = Customer.convert.from.csvRowList.to.jsonMapList(testCustomer.csvRowList);
      expect(jsonMapList.length, testCustomer.csvRowList.length);
    });
    test('To DynamicMapList', () {
      final dynamicMapList =
          Customer.convert.from.csvRowList.to.dynamicMapList(testCustomer.csvRowList);
      expect(dynamicMapList.length, testCustomer.csvRowList.length);
    });
    test('To ObjectMapList', () {
      final objectMapList =
          Customer.convert.from.csvRowList.to.objectMapList(testCustomer.csvRowList);
      expect(objectMapList.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapListString', () {
      final jsonMapListString =
          Customer.convert.from.csvRowList.to.jsonMapListString(testCustomer.csvRowList);
      expect(jsonMapListString.contains(testCustomer.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.csvRowList.to
          .jsonMapListFile(testCustomer.csvRowList, testCustomer.outputJsonMapListFile);
    });
    test('To CsvRowList', () {
      final csvRowList = Customer.convert.from.csvRowList.to.csvRowList(testCustomer.csvRowList);
      expect(csvRowList.length, testCustomer.csvRowList.length);
    });
    test('To CsvRowListString', () {
      final csvRowListString =
          Customer.convert.from.csvRowList.to.csvRowListString(testCustomer.csvRowList);
      expect(csvRowListString.contains(testCustomer.name), isTrue);
    });
    test('To CsvRowListFile', () {
      Customer.convert.from.csvRowList.to
          .csvRowListFile(testCustomer.csvRowList, testCustomer.outputCsvRowFile);
    });
  });
}
