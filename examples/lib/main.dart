import 'package:flutter/material.dart';
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
  DemoPage({super.key});

  final contactDetails = ContactDetails(
    name: 'Person One',
    address: '1 there street, somewhere',
    phone: '1111 111 111',
    email: 'persoon@one.id.au',
  );

  @override
  Widget build(BuildContext context) {
    String jsonMapString = ContactDetails.to.jsonStringFromMode(contactDetails);
    Map<String, dynamic> jsonData = ContactDetails.to.jsonFromModel(contactDetails);
    List<Map<String, dynamic>> jsonListOfMaps =
        ContactDetails.to.jsonListFromModelList([contactDetails]);
    List<List<dynamic>> csvData = ContactDetails.to.csvListModelList([contactDetails]);

    ContactDetails contactDetailsFromJsonString = ContactDetails.from.fromJsonString(jsonMapString);
    ContactDetails contactDetailsFromJsonData = ContactDetails.from.fromJson(jsonData);
    List<ContactDetails> contactDetailsFromListOfJsonMaps =
        ContactDetails.from.jsonListToModelList(jsonListOfMaps);
    List<ContactDetails> contactDetailsFromCsvData =
        ContactDetails.from.csvListToModelList(csvData);

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
