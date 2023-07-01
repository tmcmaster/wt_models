import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

import '../dsl_test_data.dart';
import '../models/customer.dart';

void main() {
  final log = logger('DSL Convert From Test', level: Level.debug);

  final testCustomer = DslTestData.customer();

  group('Convert from Model', () {
    test('To Model', () {
      final Customer customer = Customer.convert.from.model.to.model(testCustomer.model);
      expect(customer, equals(testCustomer.model));
    });
    test('To JsonMap', () {
      final JsonMap customerJsonMap = Customer.convert.from.model.to.jsonMap(testCustomer.model);
      expect(customerJsonMap, isNotEmpty);
    });
    test('To JsonMapString', () {
      final String customerJsonMapString =
          Customer.convert.from.model.to.jsonMapString(testCustomer.model);
      expect(customerJsonMapString, isNotEmpty);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.model.to.jsonMapFile(testCustomer.model, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      final csvRow = Customer.convert.from.model.to.csvRow(testCustomer.model);
      expect(csvRow.length, 6);
    });
    test('To CsvRowString', () {
      final csvRowString = Customer.convert.from.model.to.csvRowString(testCustomer.model);
      expect(csvRowString.contains(testCustomer.model.name), isTrue);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.model.to.csvRowFile(testCustomer.model, testCustomer.csvRowFile);
    });
  });
  group('Convert from JsonMap', () {
    test('To Model', () {
      final Customer customer = Customer.convert.from.jsonMap.to.model(testCustomer.jsonMap);
      expect(customer.name, isNotEmpty);
    });
    test('To JsonMap', () {
      final JsonMap jsonMap = Customer.convert.from.jsonMap.to.jsonMap(testCustomer.jsonMap);
      expect(jsonMap, equals(testCustomer.jsonMap));
    });
    test('To JsonMapString', () {
      final String jsonMapString =
          Customer.convert.from.jsonMap.to.jsonMapString(testCustomer.jsonMap);
      expect(jsonMapString, isNotEmpty);
    });
    test('To JsonMapFile', () {
      Customer.convert.from.jsonMap.to.jsonMapFile(testCustomer.jsonMap, testCustomer.jsonMapFile);
    });
    test('To CsvRow', () {
      Customer.convert.from.jsonMap.to.csvRow(testCustomer.jsonMap);
    });
    test('To CsvRowString', () {
      Customer.convert.from.jsonMap.to.csvRowString(testCustomer.jsonMap);
    });
    test('To CsvRowFile', () {
      Customer.convert.from.jsonMap.to.csvRowFile(testCustomer.jsonMap, testCustomer.csvRowFile);
    });
  });
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
