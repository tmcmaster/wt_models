import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

mixin TypeSupport<T> {
  Type getType() => T;
}

@freezed
class Customer extends BaseModelV2<Customer> with _$Customer {
  static final convert = DslConvert<Customer>(
    titles: ['id', 'name', 'phone', 'email', 'address', 'postcode'],
    jsonToModel: Customer.fromJson,
    none: Customer.empty(),
  );

  factory Customer({
    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: Customer.parsePostcode) required int postcode,
  }) = _Customer;

  Customer._();

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  factory Customer.empty() => Customer(
        id: '',
        name: '',
        phone: '',
        email: '',
        address: '',
        postcode: 0,
      );

  static int parsePostcode(dynamic value) => value is int
      ? value
      : value is String
          ? int.parse(value)
          : 0;

  @override
  String getId() => id;

  @override
  String getTitle() => name;

  @override
  List<String> getTitles() => convert.to.title();
}
