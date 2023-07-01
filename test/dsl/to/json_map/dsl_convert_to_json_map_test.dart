import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.debug);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot JsonMap', () {
    test('From Model', () {
      final jsonMap = Customer.convert.to.jsonMap.from.model(testCustomer.model);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMap', () {
      final jsonMap = Customer.convert.to.jsonMap.from.jsonMap(testCustomer.jsonMap);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapString', () {
      final jsonMap = Customer.convert.to.jsonMap.from.jsonMapString(testCustomer.jsonMapString);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From JsonMapFile', () {
      final jsonMap = Customer.convert.to.jsonMap.from.jsonMapFile(testCustomer.jsonMapFile);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRow', () {
      final jsonMap = Customer.convert.to.jsonMap.from.csvRow(testCustomer.csvRow);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowString', () {
      final jsonMap = Customer.convert.to.jsonMap.from.csvRowString(testCustomer.csvRowString);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('From CsvRowFile', () {
      final jsonMap = Customer.convert.to.jsonMap.from.csvRowFile(testCustomer.csvRowFile);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
  });
}
