# wt_models
Package augments the Freezed library, to assist with transforming model data into different formats.

## Example mode definition

This is an example of a Freezed model class, that has been augmented with the wt_models library.

```dart
@freezed
class ContactDetails extends BaseModel<ContactDetails> with _$ContactDetails {
  static final convert = DslConvert<ContactDetails>(
    titles: ['name', 'address', 'phone', 'email'],
    jsonToModel: ContactDetails.fromJson,
    none: ContactDetails.empty(),
  );

  factory ContactDetails({
    required String name,
    required String address,
    required String phone,
    required String email,
    String? placeId,
  }) = _ContactDetails;

  ContactDetails._();

  factory ContactDetails.fromJson(Map<String, dynamic> json) => _$ContactDetailsFromJson(json);

  factory ContactDetails.empty() => ContactDetails(
        name: '',
        address: '',
        phone: '',
        email: '',
      );

  @override
  String getId() => email;

  @override
  String getTitle() => name;

  @override
  List<String> getTitles() => convert.titles();
}
```

## Setup some test data

```dart
File outputDirPath = 'tmp/output';
File jsonFile = File('$outputDirPath/jsonMap.json');
File jsonListFile = File('$outputDirPath/jsonMapList.json');
File csvRowFile = File('$outputDirPath/csvRow.csv');
File csvRowListFile = File('$outputDirPath/csvRowListList.csv');

static final contactDetails = ContactDetails(
    name: 'Person One',
    address: '1 there street, somewhere',
    phone: '1111 111 111',
    email: 'persoon@one.id.au',
);
static final contactDetailsList = [contactDetails];


```
## Model -> JSON Formats

Example of converting to and from a model and JSON formats


```dart
void main() {
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
```


## Model -> CSV Formats

Example of converting to and from a model and CSV formats

```dart
void main() {
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
```