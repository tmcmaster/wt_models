import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRowString Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRowString', () {
    test('To Model', () {
      final model = Customer.convert.from.csvRowString.to.model(testCustomer.csvRowString);
      expect(model.name, testCustomer.model.name);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.csvRowString.to.jsonMap(testCustomer.csvRowString);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('To JsonMapString', () {
      final jsonMapString =
          Customer.convert.from.csvRowString.to.jsonMapString(testCustomer.csvRowString);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.csvRowString.to
          .jsonMapFile(testCustomer.csvRowString, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.csvRowString.to.csvRow(testCustomer.csvRowString);
      expect(csvRow, testCustomer.csvRow);
    });
    test('To CsvRowString', () {
      final csvRowString =
          Customer.convert.from.csvRowString.to.csvRowString(testCustomer.csvRowString);
      expect(csvRowString, testCustomer.csvRowString);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.csvRowString.to
          .csvRowFile(testCustomer.csvRowString, testCustomer.csvRowFile);
    });
  });
}
