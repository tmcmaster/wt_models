import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/model_transform.dart';

import 'customer.dart';
import 'driver.dart';
import 'supplier.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

@freezed
class Delivery extends BaseModel<Delivery> with _$Delivery {
  static final convert = ModelTransform<Delivery>(
    titles: ['customer', 'driver', 'supplier'],
    jsonToModel: Delivery.fromJson,
    none: Delivery(),
  );

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

  @override
  List<String> getTitles() => convert.to.titles;
}
