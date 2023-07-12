import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMap Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMapList', () {
    test('To ModelList', () {
      final modelList = Customer.convert.from.jsonMapList.to.modelList(testCustomer.jsonMapList);
      expect(modelList.length, testCustomer.modelList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList =
          Customer.convert.from.jsonMapList.to.jsonMapList(testCustomer.jsonMapList);
      expect(jsonMapList.length, testCustomer.jsonMapList.length);
    });
    test('To DynamicMapList', () {
      final dynamicMapList =
          Customer.convert.from.jsonMapList.to.dynamicMapList(testCustomer.jsonMapList);
      expect(dynamicMapList.length, testCustomer.jsonMapList.length);
    });
    test('To ObjectMapList', () {
      final objectMapList =
          Customer.convert.from.jsonMapList.to.objectMapList(testCustomer.jsonMapList);
      expect(objectMapList.length, testCustomer.jsonMapList.length);
    });
    test('To JsonMapListString', () {
      final jsonMapListString =
          Customer.convert.from.jsonMapList.to.jsonMapListString(testCustomer.jsonMapList);
      expect(jsonMapListString.contains(testCustomer.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.jsonMapList.to
          .jsonMapListFile(testCustomer.jsonMapList, testCustomer.outputJsonMapListFile);
    });
    test('To JsonMapList', () {
      final csvRowList = Customer.convert.from.jsonMapList.to.csvRowList(testCustomer.jsonMapList);
      expect(csvRowList.length, testCustomer.jsonMapList.length);
    });
    test('To JsonMapListString', () {
      final csvRowListString =
          Customer.convert.from.jsonMapList.to.csvRowListString(testCustomer.jsonMapList);
      expect(csvRowListString.contains(testCustomer.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.jsonMapList.to
          .csvRowListFile(testCustomer.jsonMapList, testCustomer.outputCsvRowFile);
    });
  });
}
