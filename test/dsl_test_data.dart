import 'dart:io';

import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

import 'models/customer.dart';

class DslTestData<T extends BaseModel<T>> {
  final T model;
  late List<T> modelList;
  late String name;
  late JsonMap jsonMap;
  late List<JsonMap> jsonMapList;
  late String jsonMapString;
  late String jsonMapListString;
  late CsvRow csvRow;
  late List<CsvRow> csvRowList;
  late String csvRowString;
  late String csvRowListString;
  late String csvRowFileString;
  late String csvRowListFileString;
  late File csvRowFile;
  late File csvRowListFile;
  late File jsonMapFile;
  late File jsonMapListFile;
  late File outputCsvRowFile;
  late File outputCsvRowListFile;
  late File outputJsonMapFile;
  late File outputJsonMapListFile;

  DslTestData(this.model) {
    modelList = [model];
    name = model.getType().toString().toLowerCase();
    jsonMap = model.toJson();
    jsonMapList = [jsonMap];
    jsonMapString = Dsl.jsonEncode(jsonMap);
    jsonMapListString = Dsl.jsonEncode(jsonMapList);
    csvRow = Dsl.jsonMapToCsvRow(jsonMap, Customer.convert.titles());
    csvRow = Dsl.jsonMapToCsvRow(jsonMap, Customer.convert.titles());
    csvRowList = [csvRow];
    csvRowString = Dsl.csvEncode([
      Customer.convert.titles(),
      csvRow,
    ]);
    csvRowListString = Dsl.csvEncode([
      Customer.convert.titles(),
      ...csvRowList,
    ]);
    csvRowFileString = Dsl.csvEncode([
      Customer.convert.titles(),
      csvRow,
    ]);
    csvRowListFileString = Dsl.csvEncode([
      Customer.convert.titles(),
      ...csvRowList,
    ]);
    csvRowFile = File('test/test_data/$name.csv');
    csvRowListFile = File('test/test_data/${name}_list.csv');
    jsonMapFile = File('test/test_data/$name.json');
    jsonMapListFile = File('test/test_data/${name}_list.json');

    outputCsvRowFile = File('test/test_data/output/$name.csv');
    outputCsvRowListFile = File('test/test_data/output/${name}_list.csv');
    outputJsonMapFile = File('test/test_data/output/$name.json');
    outputJsonMapListFile = File('test/test_data/output/${name}_list.json');
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
