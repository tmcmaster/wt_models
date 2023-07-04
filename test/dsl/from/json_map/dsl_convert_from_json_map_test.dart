import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMap Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMap', () {
    test('To Model', () {
      final Customer customer = Customer.convert.from.jsonMap.to.model(testCustomer.jsonMap);
      expect(customer.name, isNotEmpty);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.jsonMap.to.jsonMap(testCustomer.jsonMap);
      expect(jsonMap, equals(testCustomer.jsonMap));
    });
    test('To DynamicMap', () {
      final dynamicMao = Customer.convert.from.jsonMap.to.dynamicMap(testCustomer.jsonMap);
      expect(dynamicMao, equals(testCustomer.jsonMap));
    });
    test('To ObjectMap', () {
      final objectMap = Customer.convert.from.jsonMap.to.objectMap(testCustomer.jsonMap);
      expect(objectMap, equals(testCustomer.jsonMap));
    });
    test('To JsonMapString', () {
      final String jsonMapString =
          Customer.convert.from.jsonMap.to.jsonMapString(testCustomer.jsonMap);
      expect(jsonMapString, isNotEmpty);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.jsonMap.to.jsonMapFile(testCustomer.jsonMap, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      Customer.convert.from.jsonMap.to.csvRow(testCustomer.jsonMap);
    });
    test('To CsvRowString', () {
      Customer.convert.from.jsonMap.to.csvRowString(testCustomer.jsonMap);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.jsonMap.to.csvRowFile(testCustomer.jsonMap, testCustomer.csvRowFile);
    });
  });
}
