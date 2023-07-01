import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRow Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRow', () {
    test('To Model', () {
      final model = Customer.convert.from.csvRow.to.model(testCustomer.csvRow);
      expect(model.name, testCustomer.model.name);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.csvRow.to.jsonMap(testCustomer.csvRow);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('To JsonMapString', () {
      final jsonMapString = Customer.convert.from.csvRow.to.jsonMapString(testCustomer.csvRow);
      expect(jsonMapString.contains(testCustomer.name), isTrue);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.csvRow.to.jsonMapFile(testCustomer.csvRow, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.csvRow.to.csvRow(testCustomer.csvRow);
      expect(csvRow, testCustomer.csvRow);
    });
    test('To CsvRowString', () {
      final csvRowString = Customer.convert.from.csvRow.to.csvRowString(testCustomer.csvRow);
      expect(csvRowString, testCustomer.csvRowString);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.csvRow.to.csvRowFile(testCustomer.csvRow, testCustomer.csvRowFile);
    });
  });
}
