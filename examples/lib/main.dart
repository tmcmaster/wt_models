import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wt_logging/wt_logging.dart';
import 'package:wt_models/wt_models.dart';
import 'package:wt_models_examples/models/contact_details.dart';

void main() {
  final outputDir = Directory(DemoPage.outputDirPath);
  if (!outputDir.existsSync()) {
    outputDir.create();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo wt_models',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  static final log = logger(DemoPage, level: Level.debug);

  static final contactDetails = ContactDetails(
    name: 'Person One',
    address: '1 there street, somewhere',
    phone: '1111 111 111',
    email: 'persoon@one.id.au',
  );
  static final contactDetailsList = [contactDetails];

  static const outputDirPath = 'tmp/output';
  static final jsonFile = File('$outputDirPath/jsonMap.json');
  static final jsonListFile = File('$outputDirPath/jsonMapList.json');
  static final csvRowFile = File('$outputDirPath/csvRow.csv');
  static final csvRowListFile = File('$outputDirPath/csvRowListList.csv');

  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    log.d(File('.').absolute.path);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo wt_models'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => testConvertingToAndFromJsonTypes(),
              child: const Text('To and from JsonMap data types'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => testConvertingToAndFromCsvTypes(),
              child: const Text('To and from CsvRow data types'),
            ),
          ],
        ),
      ),
    );
  }

  void testConvertingToAndFromJsonTypes() {
    final JsonMap jsonMap = ContactDetails.convert.from.model.to.jsonMap(contactDetails);
    final ContactDetails modelFromJsonMap = ContactDetails.convert.to.model.from.jsonMap(jsonMap);
    log.d('JsonMap: $jsonMap, Model: $modelFromJsonMap');

    final String jsonMapString = ContactDetails.convert.from.model.to.jsonMapString(contactDetails);
    final ContactDetails modelFromJsonMapString =
        ContactDetails.convert.to.model.from.jsonMapString(jsonMapString);
    log.d('JsonMapString: $jsonMapString, Model: $modelFromJsonMapString');

    ContactDetails.convert.from.model.to.jsonMapFile(contactDetails, jsonFile);
    final ContactDetails modelFromJsonMapFile =
        ContactDetails.convert.to.model.from.jsonMapFile(jsonFile);
    log.d('jsonMapFile: Model: $modelFromJsonMapFile');

    final List<JsonMap> jsonMapList =
        ContactDetails.convert.from.modelList.to.jsonMapList(contactDetailsList);
    final List<ContactDetails> modelListFromJsonMapList =
        ContactDetails.convert.to.modelList.from.jsonMapList(jsonMapList);
    log.d('JsonMapList: $jsonMapList, Model List: $modelListFromJsonMapList');

    final String jsonMapListString =
        ContactDetails.convert.from.modelList.to.jsonMapListString(contactDetailsList);
    final List<ContactDetails> modelListFromJsonMapListString =
        ContactDetails.convert.to.modelList.from.jsonMapListString(jsonMapListString);
    log.d('JsonMapListString: $jsonMapListString, Model List: $modelListFromJsonMapListString');

    ContactDetails.convert.from.modelList.to.jsonMapListFile(contactDetailsList, jsonListFile);
    final List<ContactDetails> modelListFromJsonMapListFile =
        ContactDetails.convert.to.modelList.from.jsonMapListFile(jsonListFile);
    log.d('jsonMapListFile: Model List: $modelListFromJsonMapListFile');
  }

  void testConvertingToAndFromCsvTypes() {
    final CsvRow csvRow = ContactDetails.convert.from.model.to.csvRow(contactDetails);
    final ContactDetails modelFromCsvRow = ContactDetails.convert.to.model.from.csvRow(csvRow);
    log.d('CsvRow: $csvRow, Model: $modelFromCsvRow');

    final String csvRowString = ContactDetails.convert.from.model.to.csvRowString(contactDetails);
    final ContactDetails modelFromCsvRowString =
        ContactDetails.convert.to.model.from.csvRowString(csvRowString);
    log.d('CsvRowString: $csvRowString, Model: $modelFromCsvRowString');

    ContactDetails.convert.from.model.to.csvRowFile(contactDetails, csvRowFile);
    final ContactDetails modelFromCsvRowFile =
        ContactDetails.convert.to.model.from.csvRowFile(csvRowFile);
    log.d('csvRowFile: Model: $modelFromCsvRowFile');

    final List<CsvRow> csvRowList =
        ContactDetails.convert.from.modelList.to.csvRowList(contactDetailsList);
    final List<ContactDetails> modelListFromCsvRowList =
        ContactDetails.convert.to.modelList.from.csvRowList(csvRowList);
    log.d('CsvRowList: $csvRowList, Model List: $modelListFromCsvRowList');

    final String csvRowListString =
        ContactDetails.convert.from.modelList.to.csvRowListString(contactDetailsList);
    final List<ContactDetails> modelListFromCsvRowListString =
        ContactDetails.convert.to.modelList.from.csvRowListString(csvRowListString);
    log.d('CsvRowListString: $csvRowListString, Model List: $modelListFromCsvRowListString');

    ContactDetails.convert.from.modelList.to.csvRowListFile(contactDetailsList, csvRowListFile);
    final List<ContactDetails> modelListFromCsvRowListFile =
        ContactDetails.convert.to.modelList.from.csvRowListFile(csvRowFile);
    log.d('csvRowListFile: Model List: $modelListFromCsvRowListFile');
  }
}
