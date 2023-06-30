import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'contact_details.freezed.dart';
part 'contact_details.g.dart';

@freezed
class ContactDetails extends IdJsonSupport<ContactDetails> with _$ContactDetails {
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

  @override
  String getId() => name;
}
