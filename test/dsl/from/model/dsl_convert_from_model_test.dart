import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from Model', () {
    test('To Model', () {
      final Customer customer = Customer.convert.from.model.to.model(testCustomer.model);
      expect(customer, equals(testCustomer.model));
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.model.to.jsonMap(testCustomer.model);
      expect(jsonMap, isNotEmpty);
    });
    test('To DynamicMap', () {
      final dynamicMap = Customer.convert.from.model.to.dynamicMap(testCustomer.model);
      expect(dynamicMap, isNotEmpty);
    });
    test('To ObjectMap', () {
      final objectMap = Customer.convert.from.model.to.objectMap(testCustomer.model);
      expect(objectMap, isNotEmpty);
    });
    test('To JsonMapString', () {
      final String jsonMapString = Customer.convert.from.model.to.jsonMapString(testCustomer.model);
      expect(jsonMapString, isNotEmpty);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.model.to.jsonMapFile(testCustomer.model, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.model.to.csvRow(testCustomer.model);
      expect(csvRow.length, 6);
    });
    test('To CsvRowString', () {
      final csvRowString = Customer.convert.from.model.to.csvRowString(testCustomer.model);
      expect(csvRowString.contains(testCustomer.model.name), isTrue);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.model.to.csvRowFile(testCustomer.model, testCustomer.csvRowFile);
    });
  });
}
