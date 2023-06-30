import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:wt_logging/wt_logging.dart';

import 'models/customer.dart';
import 'models/delivery.dart';
import 'models/driver.dart';
import 'models/supplier.dart';

void main() {
  final log = logger('Models Test', level: Level.debug);

  final toJsonString = const JsonEncoder.withIndent('  ').convert;

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

  test('Testing', () {
    Delivery.convert.to.jsonMapListFromModelList([]);
    Customer.convert.from.jsonMapListToModelList([]);
  });
  group('toJson', () {
    test('Customer', () {
      final jsonMap = delivery.customer!.toJson();
      final expectedKeys = {'id', 'name', 'phone', 'email', 'address', 'postcode'};
      expect(jsonMap.keys.length, expectedKeys.length);
      expect(jsonMap.keys.toSet(), expectedKeys);
      expect(jsonMap['id'], delivery.customer!.id);
      expect(jsonMap['name'], delivery.customer!.name);
      expect(jsonMap['phone'], delivery.customer!.phone);
      expect(jsonMap['email'], delivery.customer!.email);
      expect(jsonMap['address'], delivery.customer!.address);
      expect(jsonMap['postcode'], delivery.customer!.postcode);
      final expectedJsonMapString = File('test/test_data/customer.json').readAsStringSync();
      final jsonMapString = toJsonString(jsonMap);
      expect(jsonMapString, expectedJsonMapString);
    });
  });

  group(
    'Generate Test Data',
    () {
      test('Customer', () {
        final file = File('test/test_data/customer.json')
          ..writeAsString(toJsonString(delivery.customer!.toJson()));
        log.d('Generated test data file for Customer: ${file.path}');
      });
      test('Driver', () {
        final file = File('test/test_data/driver.json')
          ..writeAsString(toJsonString(delivery.driver!.toJson()));
        log.d('Generated test data file for Driver: ${file.path}');
      });
      test('Supplier', () {
        final file = File('test/test_data/supplier.json')
          ..writeAsString(toJsonString(delivery.supplier!.toJson()));
        log.d('Generated test data file for Supplier: ${file.path}');
      });
      test('Delivery', () {
        final file = File('test/test_data/delivery.json')
          ..writeAsString(toJsonString(delivery.toJson()));
        log.d('Generated test data file for Delivery: ${file.path}');
      });
    },
    skip: true,
  );
}
