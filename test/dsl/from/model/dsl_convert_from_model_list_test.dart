import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model List Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from Model List', () {
    test('To Model', () {
      final List<Customer> customerList =
          Customer.convert.from.modelList.to.modelList(testCustomer.modelList);
      expect(customerList.length, testCustomer.modelList.length);
    });
    test('To JsonMap', () {
      final jsonMapList = Customer.convert.from.modelList.to.jsonMapList(testCustomer.modelList);
      expect(jsonMapList.length, testCustomer.modelList.length);
    });
    test('To DynamicMap', () {
      final dynamicMapList =
          Customer.convert.from.modelList.to.dynamicMapList(testCustomer.modelList);
      expect(dynamicMapList.length, testCustomer.modelList.length);
    });
    test('To ObjectMap', () {
      final objectMapList =
          Customer.convert.from.modelList.to.objectMapList(testCustomer.modelList);
      expect(objectMapList.length, testCustomer.modelList.length);
    });
    test('To JsonMapString', () {
      final String jsonMapListString =
          Customer.convert.from.modelList.to.jsonMapListString(testCustomer.modelList);
      expect(jsonMapListString.contains(testCustomer.modelList[0].address), isTrue);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.modelList.to
          .jsonMapListFile(testCustomer.modelList, testCustomer.outputJsonMapFile);
    });
    test('To CsvRow', () {
      final csvRowList = Customer.convert.from.modelList.to.csvRowList(testCustomer.modelList);
      expect(csvRowList.length, testCustomer.modelList.length);
    });
    test('To CsvRowString', () {
      final csvRowListString =
          Customer.convert.from.modelList.to.csvRowListString(testCustomer.modelList);
      expect(csvRowListString.contains(testCustomer.modelList[0].address), isTrue);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.modelList.to
          .csvRowListFile(testCustomer.modelList, testCustomer.outputCsvRowFile);
    });
  });
}
