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

## Model -> Data Types

Example of converting from a model to other formats


```dart
    JsonMap jsonMap = ContactDetails.convert.from.model.to.jsonMap(contactDetails);

    String jsonMapString = ContactDetails.convert.from.model.to.jsonMapString(contactDetails);

    ContactDetails.convert.from.model.to.jsonMapFile(contactDetails, jsonFile);

    List<JsonMap> jsonMapList = ContactDetails.convert.from.modelList.to.jsonMapList(contactDetailsList);

    String jsonMapListString = ContactDetails.convert.from.modelList.to.jsonMapListString(contactDetailsList);

    ContactDetails.convert.from.modelList.to.jsonMapListFile(contactDetailsList, jsonListFile);
```


## Data Types -> Model

Example of converting from data types to a model.

```dart
    CsvRow csvRow = ContactDetails.convert.from.model.to.csvRow(contactDetails);

    String csvMapString = ContactDetails.convert.from.model.to.csvRowString(contactDetails);

    ContactDetails.convert.from.model.to.csvRowFile(contactDetails, csvRowFile);

    List<CsvRow> csvRowList = ContactDetails.convert.from.modelList.to.csvRowList(contactDetailsList);

    String csvRowListString = ContactDetails.convert.from.modelList.to.csvRowListString(contactDetailsList);

    ContactDetails.convert.from.modelList.to.csvRowListFile(contactDetailsList, csvRowListFile);

```
