import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/from_model_to.dart';
import 'package:wt_models/src/to_model_from.dart';

import 'customer.dart';
import 'driver.dart';
import 'supplier.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

@freezed
class Delivery extends BaseModel<Delivery> with _$Delivery {
  static final from = ToModelFrom<Delivery>(json: _Delivery.fromJson, titles: _titles);
  static final to = FromModelTo<Delivery>(titles: _titles);

  static final _titles = ['customer', 'driver', 'supplier'];

  factory Delivery({
    Customer? customer,
    Driver? driver,
    Supplier? supplier,
  }) = _Delivery;

  Delivery._();

  factory Delivery.fromJson(Map<String, dynamic> json) => _$DeliveryFromJson(json);

  @override
  String getId() => customer?.getId() ?? driver?.getId() ?? supplier?.getId() ?? '';

  @override
  String getTitle() => customer?.getTitle() ?? 'Customer';
}
