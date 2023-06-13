# wt_models
Package augments the Freezed library, to assist with transforming model data into different formats.

## Example mode definition

This is an example of a Freezed model class, that has been augmented with the wt_models library.

```dart
@freezed
class ContactDetails with _$ContactDetails, JsonSupport {
  factory ContactDetails({
    required String name,
    required String address,
    required String phone,
    required String email,
    String? placeId,
  }) = _ContactDetails;

  static final List<String> titles = ['name', 'address', 'phone', 'email'];

  ContactDetails._();

  static final from = ToModelFrom<ContactDetails>(json: _$ContactDetailsFromJson, titles: titles);
  static final to = FromModelTo<ContactDetails>(titles: titles);

  factory ContactDetails.fromJson(Map<String, dynamic> json) => _$ContactDetailsFromJson(json);
}
```

## The FromModelTo class

The FromModelTo class contains transforms for converting models into different formats.
Some example of using the library:

```dart
    String jsonMap = ContactDetails.to.jsonStringFromMode(contactDetails);
    Map<String, dynamic> jsonData = ContactDetails.to.jsonFromModel(contactDetails);
    List<Map<String, dynamic>> jsonListOfMaps = ContactDetails.to.jsonListFromModelList([contactDetails]);
    List<List<dynamic>> csvList = ContactDetails.to.csvListModelList([contactDetails]);
```

## The ToModelFrom class

The ToModelFrom class contains transforms for converting from different formats, into model objects.
Some example of using the library:
```dart
    ContactDetails fromJsonString = ContactDetails.from.fromJsonString(jsonMapString);
    ContactDetails fromJsonData = ContactDetails.from.fromJson(jsonData);
    List<ContactDetails> fromListOfJsonMaps = ContactDetails.from.jsonListToModelList(jsonListOfMaps);
    List<ContactDetails> fromCsvData = ContactDetails.from.csvListToModelList(csvData);
```
