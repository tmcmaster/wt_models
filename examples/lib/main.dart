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
              onPressed: () => testConvertingFromToJsonTypes(),
              child: const Text('From Model to JsonMap data types'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => testConvertingFromToCsvTypes(),
              child: const Text('From Model to CsvRow data types'),
            ),
          ],
        ),
      ),
    );
  }

  // converting from a model to different JsonMap based types including writing to files
  void testConvertingFromToJsonTypes() {
    final JsonMap jsonMap = ContactDetails.convert.from.model.to.jsonMap(contactDetails);
    final String jsonMapString = ContactDetails.convert.from.model.to.jsonMapString(contactDetails);
    ContactDetails.convert.from.model.to.jsonMapFile(contactDetails, jsonFile);

    final List<JsonMap> jsonMapList =
        ContactDetails.convert.from.modelList.to.jsonMapList(contactDetailsList);
    final String jsonMapListString =
        ContactDetails.convert.from.modelList.to.jsonMapListString(contactDetailsList);
    ContactDetails.convert.from.modelList.to.jsonMapListFile(contactDetailsList, jsonListFile);

    // logging results
    log.d('JsonMap: $jsonMap');
    log.d('JsonMapString: $jsonMapString');
    log.d('JsonMapList: $jsonMapList');
    log.d('JsonMapListString: $jsonMapListString');
  }

  // converting from a model to different CsvRow bases types including writing to files
  void testConvertingFromToCsvTypes() {
    final CsvRow csvRow = ContactDetails.convert.from.model.to.csvRow(contactDetails);
    final String csvMapString = ContactDetails.convert.from.model.to.csvRowString(contactDetails);
    ContactDetails.convert.from.model.to.csvRowFile(contactDetails, csvRowFile);

    final List<CsvRow> csvRowList =
        ContactDetails.convert.from.modelList.to.csvRowList(contactDetailsList);
    final String csvRowListString =
        ContactDetails.convert.from.modelList.to.csvRowListString(contactDetailsList);
    ContactDetails.convert.from.modelList.to.csvRowListFile(contactDetailsList, csvRowListFile);

    log.d('CsvRow: $csvRow');
    log.d('CsvRowString: $csvMapString');
    log.d('CsvRowList: $csvRowList');
    log.d('CsvRowListString: $csvRowListString');
  }
}
