import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'contact_details.freezed.dart';
part 'contact_details.g.dart';

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
