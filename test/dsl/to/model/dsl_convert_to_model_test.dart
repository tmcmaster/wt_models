import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot Model', () {
    test('From Model', () {
      final Customer customer = Customer.convert.to.model.from.model(testCustomer.model);
      expect(customer, equals(testCustomer.model));
    });
    test('From JsonMap', () {
      final customer = Customer.convert.to.model.from.jsonMap(testCustomer.jsonMap);
      expect(customer.name, equals(testCustomer.model.name));
    });
    test('From JsonMapString', () {
      final customer = Customer.convert.to.model.from.jsonMapString(testCustomer.jsonMapString);
      expect(customer.name, equals(testCustomer.model.name));
    });
    test('From JsonMapFile', () {
      final customer = Customer.convert.to.model.from.jsonMapFile(testCustomer.jsonMapFile);
      expect(customer.name, equals(testCustomer.model.name));
    });
    test('From CsvRow', () {
      final customer = Customer.convert.to.model.from.csvRow(testCustomer.csvRow);
      expect(customer.name, equals(testCustomer.model.name));
    });
    test('From CsvRowString', () {
      final customer = Customer.convert.to.model.from.csvRowString(testCustomer.csvRowString);
      expect(customer.name, equals(testCustomer.model.name));
    });
    test('From CsvRowFile', () {
      final customer = Customer.convert.to.model.from.csvRowFile(testCustomer.csvRowFile);
      expect(customer.name, equals(testCustomer.model.name));
    });
  });
}
