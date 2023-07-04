import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot DynamicMap', () {
    test('From Model', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.model(testCustomer.model);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMap', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.jsonMap(testCustomer.jsonMap);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From DynamicMap', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.dynamicMap(testCustomer.jsonMap);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From ObjectMap', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.objectMap(testCustomer.jsonMap);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapString', () {
      final dynamicMap =
          Customer.convert.to.dynamicMap.from.jsonMapString(testCustomer.jsonMapString);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapFile', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.jsonMapFile(testCustomer.jsonMapFile);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRow', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.csvRow(testCustomer.csvRow);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowString', () {
      final dynamicMap =
          Customer.convert.to.dynamicMap.from.csvRowString(testCustomer.csvRowString);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowFile', () {
      final dynamicMap = Customer.convert.to.dynamicMap.from.csvRowFile(testCustomer.csvRowFile);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
  });
}
