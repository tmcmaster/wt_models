import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Model Test', level: Level.debug);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert ot JsonMapFile', () {
    test('From Model', () {
      Customer.convert.to.jsonMapFile.from.model(testCustomer.model, testCustomer.jsonMapFile);
    });
    test('From JsonMap', () {
      Customer.convert.to.jsonMapFile.from.jsonMap(testCustomer.jsonMap, testCustomer.jsonMapFile);
    });
    test('From JsonMapString', () {
      Customer.convert.to.jsonMapFile.from
          .jsonMapString(testCustomer.jsonMapString, testCustomer.jsonMapFile);
    });
    test('From JsonMapFile', () {
      Customer.convert.to.jsonMapFile.from
          .jsonMapFile(testCustomer.jsonMapFile, testCustomer.jsonMapFile);
    });
    test('From CsvRow', () {
      Customer.convert.to.jsonMapFile.from.csvRow(testCustomer.csvRow, testCustomer.jsonMapFile);
    });
    test('From CsvRowString', () {
      Customer.convert.to.jsonMapFile.from
          .csvRowString(testCustomer.csvRowString, testCustomer.jsonMapFile);
    });
    test('From CsvRowFile', () {
      Customer.convert.to.jsonMapFile.from
          .csvRowFile(testCustomer.csvRowFile, testCustomer.jsonMapFile);
    });
  });
}
