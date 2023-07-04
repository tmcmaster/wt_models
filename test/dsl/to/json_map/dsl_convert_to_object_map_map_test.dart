import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot ObjectMap', () {
    test('From Model', () {
      final objectMap = Customer.convert.to.objectMap.from.model(testCustomer.model);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMap', () {
      final objectMap = Customer.convert.to.objectMap.from.jsonMap(testCustomer.jsonMap);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From DynamicMap', () {
      final objectMap = Customer.convert.to.objectMap.from.dynamicMap(testCustomer.jsonMap);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From ObjectMap', () {
      final objectMap = Customer.convert.to.objectMap.from.objectMap(testCustomer.jsonMap);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapString', () {
      final objectMap =
          Customer.convert.to.objectMap.from.jsonMapString(testCustomer.jsonMapString);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapFile', () {
      final objectMap = Customer.convert.to.objectMap.from.jsonMapFile(testCustomer.jsonMapFile);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRow', () {
      final objectMap = Customer.convert.to.objectMap.from.csvRow(testCustomer.csvRow);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowString', () {
      final objectMap = Customer.convert.to.objectMap.from.csvRowString(testCustomer.csvRowString);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowFile', () {
      final objectMap = Customer.convert.to.objectMap.from.csvRowFile(testCustomer.csvRowFile);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
  });
}
