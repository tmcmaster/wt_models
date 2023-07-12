import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMapString Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMapListString', () {
    test('To Model', () {
      final List<Customer> customers =
          Customer.convert.from.jsonMapListString.to.modelList(testCustomer.jsonMapListString);
      expect(customers.length, testCustomer.jsonMapList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList =
          Customer.convert.from.jsonMapListString.to.jsonMapList(testCustomer.jsonMapListString);
      expect(jsonMapList.length, testCustomer.jsonMapList.length);
    });
    test('To DynamicMap', () {
      final dynamicMapList =
          Customer.convert.from.jsonMapListString.to.dynamicMapList(testCustomer.jsonMapListString);
      expect(dynamicMapList, isNotEmpty);
    });
    test('To ObjectListMap', () {
      final objectMap =
          Customer.convert.from.jsonMapListString.to.objectMapList(testCustomer.jsonMapListString);
      expect(objectMap, isNotEmpty);
    });
    test('To JsonMapListString', () {
      final String jsonMapListString = Customer.convert.from.jsonMapListString.to
          .jsonMapListString(testCustomer.jsonMapListString);
      expect(jsonMapListString, equals(testCustomer.jsonMapListString));
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.jsonMapListString.to
          .jsonMapListFile(testCustomer.jsonMapListString, testCustomer.outputJsonMapFile);
    });
    test('To CsvRowList', () {
      final csvRowList =
          Customer.convert.from.jsonMapListString.to.csvRowList(testCustomer.jsonMapListString);
      expect(csvRowList, isNotEmpty);
    });
    test('To CsvRowListString', () {
      final csvRowString = Customer.convert.from.jsonMapListString.to
          .csvRowListString(testCustomer.jsonMapListString);
      expect(csvRowString, isNotEmpty);
    });
    test('To CsvRowListFile', () {
      Customer.convert.from.jsonMapListString.to
          .csvRowListFile(testCustomer.jsonMapListString, testCustomer.outputCsvRowFile);
    });
  });
}
