import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMapString Test', level: Level.debug);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMapString', () {
    test('To Model', () {
      final Customer customer =
          Customer.convert.from.jsonMapString.to.model(testCustomer.jsonMapString);
      expect(customer.name, isNotEmpty);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.jsonMapString.to.jsonMap(testCustomer.jsonMapString);
      expect(jsonMap, isNotEmpty);
    });
    test('To JsonMapString', () {
      final String jsonMapString =
          Customer.convert.from.jsonMapString.to.jsonMapString(testCustomer.jsonMapString);
      expect(jsonMapString, equals(testCustomer.jsonMapString));
    });
    test('To JsonMapFile', () {
      Customer.convert.from.jsonMapString.to
          .jsonMapFile(testCustomer.jsonMapString, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.jsonMapString.to.csvRow(testCustomer.jsonMapString);
      expect(csvRow, isNotEmpty);
    });
    test('To CsvRowString', () {
      final csvRowString =
          Customer.convert.from.jsonMapString.to.csvRowString(testCustomer.jsonMapString);
      expect(csvRowString, isNotEmpty);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.jsonMapString.to
          .csvRowFile(testCustomer.jsonMapString, testCustomer.csvRowFile);
    });
  });
}
