import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

mixin TypeSupport<T> {
  Type getType() => T;
}

abstract class BaseModel<T> extends IdJsonSupport<T> with TitleSupport, TypeSupport<T> {}

@freezed
class Customer extends BaseModel<Customer> with _$Customer {
  static final from = ToModelFrom<Customer>(json: _Customer.fromJson, titles: _titles);
  static final to = FromModelTo<Customer>(titles: _titles);

  static final _titles = ['id', 'name'];

  factory Customer({
    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    required int postcode,
  }) = _Customer;

  Customer._();

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => name;
}
