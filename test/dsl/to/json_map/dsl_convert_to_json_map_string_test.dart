import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot JsonMapString', () {
    test('From Model', () {
      final jsonMapString = Customer.convert.to.jsonMapString.from.model(testCustomer.model);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From JsonMap', () {
      final jsonMapString = Customer.convert.to.jsonMapString.from.jsonMap(testCustomer.jsonMap);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From JsonMapString', () {
      final jsonMapString =
          Customer.convert.to.jsonMapString.from.jsonMapString(testCustomer.jsonMapString);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From JsonMapFile', () {
      final jsonMapString =
          Customer.convert.to.jsonMapString.from.jsonMapFile(testCustomer.jsonMapFile);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From CsvRow', () {
      final jsonMapString = Customer.convert.to.jsonMapString.from.csvRow(testCustomer.csvRow);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From CsvRowString', () {
      final jsonMapString =
          Customer.convert.to.jsonMapString.from.csvRowString(testCustomer.csvRowString);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('From CsvRowFile', () {
      final jsonMapString =
          Customer.convert.to.jsonMapString.from.csvRowFile(testCustomer.csvRowFile);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
  });
}
