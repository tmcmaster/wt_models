import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From CsvRowListFile Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from CsvRowListFile', () {
    test('To ModelList', () {
      final modelList =
          Customer.convert.from.csvRowListFile.to.modelList(testCustomer.csvRowListFile);
      expect(modelList.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList =
          Customer.convert.from.csvRowListFile.to.jsonMapList(testCustomer.csvRowListFile);
      expect(jsonMapList.length, testCustomer.csvRowList.length);
    });
    test('To DynamicMapList', () {
      final dynamicMap =
          Customer.convert.from.csvRowListFile.to.dynamicMapList(testCustomer.csvRowListFile);
      expect(dynamicMap.length, testCustomer.csvRowList.length);
    });
    test('To ObjectMapList', () {
      final objectMap =
          Customer.convert.from.csvRowListFile.to.objectMapList(testCustomer.csvRowListFile);
      expect(objectMap.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapListString', () {
      final jsonMapString =
          Customer.convert.from.csvRowListFile.to.jsonMapListString(testCustomer.csvRowListFile);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.csvRowListFile.to
          .jsonMapListFile(testCustomer.csvRowListFile, testCustomer.outputJsonMapListFile);
    });
    test('To CsvRowList', () {
      final csvRowList =
          Customer.convert.from.csvRowListFile.to.csvRowList(testCustomer.csvRowListFile);
      expect(csvRowList, testCustomer.csvRowList);
    });
    test('To CsvRowListString', () {
      final csvRowString =
          Customer.convert.from.csvRowListFile.to.csvRowListString(testCustomer.csvRowListFile);
      expect(csvRowString, testCustomer.csvRowListString);
    });
    test('To CsvRowListFile', () {
      Customer.convert.from.csvRowListFile.to
          .csvRowListFile(testCustomer.csvRowFile, testCustomer.outputCsvRowListFile);
    });
  });
}
