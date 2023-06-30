import 'package:flutter/material.dart';
import 'package:wt_logging/wt_logging.dart';
import 'package:wt_models_examples/models/contact_details.dart';

void main() {
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
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  static final log = logger(DemoPage, level: Level.debug);

  DemoPage({super.key});

  final contactDetails = ContactDetails(
    name: 'Person One',
    address: '1 there street, somewhere',
    phone: '1111 111 111',
    email: 'persoon@one.id.au',
  );

  @override
  Widget build(BuildContext context) {
    final jsonMapString = ContactDetails.to.jsonStringFromMode(contactDetails);
    final jsonData = ContactDetails.to.jsonFromModel(contactDetails);
    final jsonListOfMaps = ContactDetails.to.jsonListFromModelList([contactDetails]);
    final csvData = ContactDetails.to.csvListModelList([contactDetails]);

    final ContactDetails contactDetailsFromJsonString =
        ContactDetails.from.fromJsonString(jsonMapString);
    log.d('contactDetailsFromJsonString: $contactDetailsFromJsonString');
    final ContactDetails contactDetailsFromJsonData = ContactDetails.from.fromJson(jsonData);
    log.d('contactDetailsFromJsonData: $contactDetailsFromJsonData');
    final contactDetailsFromListOfJsonMaps =
        ContactDetails.from.jsonListToModelList(jsonListOfMaps);
    log.d('contactDetailsFromListOfJsonMaps: $contactDetailsFromListOfJsonMaps');
    final contactDetailsFromCsvData = ContactDetails.from.csvListToModelList(csvData);
    log.d('contactDetailsFromCsvData: $contactDetailsFromCsvData');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo wt_models'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WIP demo page.',
            ),
          ],
        ),
      ),
    );
  }
}
