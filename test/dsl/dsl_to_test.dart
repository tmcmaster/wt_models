import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

import '../dsl_test_data.dart';
import '../models/customer.dart';

void main() {
  final log = logger('DSL Convert To Test', level: Level.debug);

  final testCustomer = DslTestData.customer();

  group('Convert to JsonMap', () {
    test('From Model', () {
      final JsonMap jsonMapFromModel = Customer.convert.to.jsonMap.from.model(testCustomer.model);
      log.d('jsonMapFromModel: 4jsonMapFromModel');
      expect(jsonMapFromModel, isNotEmpty);
    });
    test('From String', () {
      final JsonMap jsonMapFromString =
          Customer.convert.to.jsonMap.from.string(jsonEncode(testCustomer.jsonMap));
      expect(jsonMapFromString, isNotEmpty);
    });
    test('From File', () {
      final JsonMap jsonMapFromFile =
          Customer.convert.to.jsonMap.from.file(testCustomer.jsonMapFile);
      expect(jsonMapFromFile, isNotEmpty);
    });
  });
  group('Convert to Model', () {
    test('From JsonMap', () {
      final customer = Customer.convert.to.model.from.jsonMap(testCustomer.jsonMap);
      expect(customer.name, isNotEmpty);
    });
    test('From String', () {
      final customer = Customer.convert.to.model.from.string(jsonEncode(testCustomer.jsonMap));
      expect(customer.name, isNotEmpty);
    });
    test('From File', () {
      final customer = Customer.convert.to.model.from.file(testCustomer.jsonMapFile);
      expect(customer.name, isNotEmpty);
    });
  });
}
