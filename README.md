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
## Model -> Data Types

Example of converting from a model to other formats


```dart
void main() {
  JsonMap jsonMap = ContactDetails.convert.from.model.to.jsonMap(contactDetails);

  String jsonMapString = ContactDetails.convert.from.model.to.jsonMapString(contactDetails);

  ContactDetails.convert.from.model.to.jsonMapFile(contactDetails, jsonFile);

  List<JsonMap> jsonMapList = ContactDetails.convert.from.modelList.to.jsonMapList(
      contactDetailsList);

  String jsonMapListString = ContactDetails.convert.from.modelList.to.jsonMapListString(
      contactDetailsList);

  ContactDetails.convert.from.modelList.to.jsonMapListFile(contactDetailsList, jsonListFile);
}
```


## Data Types -> Model

Example of converting from data types to a model.

```dart
void main() {
    CsvRow csvRow = ContactDetails.convert.from.model.to.csvRow(contactDetails);

    String csvMapString = ContactDetails.convert.from.model.to.csvRowString(contactDetails);
    
    ContactDetails.convert.from.model.to.csvRowFile(contactDetails, csvRowFile);
    
    List<CsvRow> csvRowList = ContactDetails.convert.from.modelList.to.csvRowList(contactDetailsList);
    
    String csvRowListString = ContactDetails.convert.from.modelList.to.csvRowListString(contactDetailsList);
    
    ContactDetails.convert.from.modelList.to.csvRowListFile(contactDetailsList, csvRowListFile);
}
```