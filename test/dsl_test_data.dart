import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

import 'models/customer.dart';

class DslTestData<T extends BaseModelV2<T>> {
  final T model;
  late String name;
  late JsonMap jsonMap;
  late String jsonMapString;
  late File jsonMapFile;
  late CsvRow csvRow;
  late String csvRowString;
  late File csvRowFile;
  late String csvRowFileString;

  DslTestData(this.model) {
    name = model.getType().toString().toLowerCase();
    jsonMap = model.toJson();
    jsonMapString = Dsl.jsonEncode(jsonMap);
    jsonMapFile = File('test/test_data/$name.json');
    csvRow = Dsl.jsonMapToCsvRow(jsonMap, Customer.convert.title());
    csvRow = Dsl.jsonMapToCsvRow(jsonMap, Customer.convert.title());
    csvRowString = Dsl.csvEncode([
      Customer.convert.title(),
      csvRow,
    ]);
    csvRowFile = File('test/test_data/$name.csv');
    csvRowFileString = Dsl.csvEncode([
      Customer.convert.title(),
      csvRow,
    ]);
  }

  static DslTestData<Customer> customer() => DslTestData(
        Customer(
          id: '001',
          name: 'Customer 1',
          phone: '040400001',
          email: 'customer+1@example.com',
          address: '1 main street, Pakenham',
          postcode: 3810,
        ),
      );
}
