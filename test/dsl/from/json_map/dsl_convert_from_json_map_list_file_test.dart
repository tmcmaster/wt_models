import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import '../../../dsl_test_data.dart';
import '../../../models/customer.dart';

void main() {
  final log = logger('DSL Convert From JsonMapListFile Test', level: Level.warning);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');

  group('Convert from JsonMapListFile', () {
    test('To ModelList', () {
      final modelList =
          Customer.convert.from.jsonMapListFile.to.modelList(testCustomer.jsonMapListFile);
      expect(modelList.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapList', () {
      final jsonMapList =
          Customer.convert.from.jsonMapListFile.to.jsonMapList(testCustomer.jsonMapListFile);
      expect(jsonMapList.length, testCustomer.csvRowList.length);
    });
    test('To DynamicMapList', () {
      final dynamicMap =
          Customer.convert.from.jsonMapListFile.to.dynamicMapList(testCustomer.jsonMapListFile);
      expect(dynamicMap.length, testCustomer.csvRowList.length);
    });
    test('To ObjectMapList', () {
      final objectMap =
          Customer.convert.from.jsonMapListFile.to.objectMapList(testCustomer.jsonMapListFile);
      expect(objectMap.length, testCustomer.csvRowList.length);
    });
    test('To JsonMapListString', () {
      final jsonMapString =
          Customer.convert.from.jsonMapListFile.to.jsonMapListString(testCustomer.jsonMapListFile);
      expect(jsonMapString.contains(testCustomer.model.name), isTrue);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.jsonMapListFile.to
          .jsonMapListFile(testCustomer.jsonMapListFile, testCustomer.outputJsonMapListFile);
    });
    test('To JsonMapList', () {
      final csvRowList =
          Customer.convert.from.jsonMapListFile.to.csvRowList(testCustomer.jsonMapListFile);
      expect(csvRowList, testCustomer.csvRowListWithTitles);
    });
    test('To JsonMapListString', () {
      final csvRowListString =
          Customer.convert.from.jsonMapListFile.to.csvRowListString(testCustomer.jsonMapListFile);
      expect(csvRowListString, testCustomer.csvRowListString);
    });
    test('To JsonMapListFile', () {
      Customer.convert.from.jsonMapListFile.to
          .csvRowListFile(testCustomer.csvRowFile, testCustomer.outputJsonMapListFile);
    });
  });
}
