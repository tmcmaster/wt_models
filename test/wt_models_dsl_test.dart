import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

import 'models/customer.dart';
import 'models/delivery.dart';
import 'models/driver.dart';
import 'models/supplier.dart';

void main() {
  final log = logger('Models DSL Test', level: Level.debug);

  final delivery = Delivery(
    customer: Customer(
      id: '001',
      name: 'Customer 1',
      phone: '040400001',
      email: 'customer+1@example.com',
      address: '1 main street, Pakenham',
      postcode: 3810,
    ),
    supplier: Supplier(
      id: '001',
      name: 'Supplier 1',
      code: 'SUP1',
    ),
    driver: Driver(
      id: '001',
      name: 'Driver 1',
      phone: '0404111111',
    ),
  );

  final JsonMap customerJsonMap = {
    'id': '001',
    'name': 'Customer 1',
    'phone': '040400001',
    'email': 'customer+1@example.com',
    'address': '1 main street, Pakenham',
    'postcode': 3810
  };

  final junkFile = File('test/test_data/junk.json');

  group('Testing DSL - to model', () {
    test('to model from JsonMap', () {
      final Customer customer = Customer.convert.from.jsonMap.to.model(customerJsonMap);
      expect(customer.name, isNotEmpty);
    });
    test('to string from JsonMap', () {
      final String jsonMapString = Customer.convert.from.jsonMap.to.string(customerJsonMap);
      expect(jsonMapString, isNotEmpty);
    });
    test('to file from JsonMap', () {
      Customer.convert.from.jsonMap.to.file(customerJsonMap, junkFile);
    });
  });
  group('Testing DSL - from model', () {
    test('from jsonMap from model', () {
      final JsonMap jsonMapFromModel = Customer.convert.to.jsonMap.from.model(delivery.customer!);
      log.d('jsonMapFromModel: 4jsonMapFromModel');
      expect(jsonMapFromModel, isNotEmpty);
    });
    test('from jsonMap from string', () {
      final JsonMap jsonMapFromString =
          Customer.convert.to.jsonMap.from.string(jsonEncode(customerJsonMap));
      expect(jsonMapFromString, isNotEmpty);
    });
    test('from jsonMap from file', () {
      final JsonMap jsonMapFromFile = Customer.convert.to.jsonMap.from.file(junkFile);
      expect(jsonMapFromFile, isNotEmpty);
    });
  });
}
