import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRowFile Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRowFile', () {
    test('To Model', () {
      final model = Customer.convert.from.csvRowFile.to.model(testCustomer.csvRowFile);
      expect(model.name, testCustomer.model.name);
    });
    test('To JsonMap', () {
      final jsonMap = Customer.convert.from.csvRowFile.to.jsonMap(testCustomer.csvRowFile);
      expect(jsonMap.length, testCustomer.csvRow.length);
    });
    test('To DynamicMap', () {
      final dynamicMap = Customer.convert.from.csvRowFile.to.dynamicMap(testCustomer.csvRowFile);
      expect(dynamicMap.length, testCustomer.csvRow.length);
    });
    test('To ObjectMap', () {
      final objectMap = Customer.convert.from.csvRowFile.to.objectMap(testCustomer.csvRowFile);
      expect(objectMap.length, testCustomer.csvRow.length);
    });
    test('To JsonMapString', () {
      final jsonMapString =
          Customer.convert.from.csvRowFile.to.jsonMapString(testCustomer.csvRowFile);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.csvRowFile.to
          .jsonMapFile(testCustomer.csvRowFile, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.csvRowFile.to.csvRow(testCustomer.csvRowFile);
      expect(csvRow, testCustomer.csvRow);
    });
    test('To CsvRowString', () {
      final csvRowString =
          Customer.convert.from.csvRowFile.to.csvRowString(testCustomer.csvRowFile);
      expect(csvRowString, testCustomer.csvRowString);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.csvRowFile.to
          .csvRowFile(testCustomer.csvRowFile, testCustomer.csvRowFile);
    });
  });
}
