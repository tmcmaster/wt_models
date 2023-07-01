import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMapFile Test', level: Level.debug);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMapFile', () {
    test('To Model', () {
      final Customer customer =
          Customer.convert.from.jsonMapFile.to.model(testCustomer.jsonMapFile);
      expect(customer.name, isNotEmpty);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.jsonMapFile.to.jsonMap(testCustomer.jsonMapFile);
      expect(jsonMap, isNotEmpty);
    });
    test('To JsonMapString', () {
      final jsonMapString =
          Customer.convert.from.jsonMapFile.to.jsonMapString(testCustomer.jsonMapFile);
      expect(jsonMapString, isNotEmpty);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.jsonMapFile.to
          .jsonMapFile(testCustomer.jsonMapFile, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.jsonMapFile.to.csvRow(testCustomer.jsonMapFile);
      expect(csvRow, isNotEmpty);
    });
    test('To CsvRowString', () {
      final csvRowString =
          Customer.convert.from.jsonMapFile.to.csvRowString(testCustomer.jsonMapFile);
      expect(csvRowString, isNotEmpty);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.jsonMapFile.to
          .csvRowFile(testCustomer.jsonMapFile, testCustomer.csvRowFile);
    });
  });
}
