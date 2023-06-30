import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/from_model_to.dart';
import 'package:wt_models/src/to_model_from.dart';

import 'customer.dart';

part 'supplier.freezed.dart';
part 'supplier.g.dart';

@freezed
class Supplier extends BaseModel<Supplier> with _$Supplier {
  static final from = ToModelFrom<Supplier>(json: _Supplier.fromJson, titles: _titles);
  static final to = FromModelTo<Supplier>(titles: _titles);

  static final _titles = ['id', 'name'];

  factory Supplier({
    required String id,
    required String name,
    required String code,
  }) = _Supplier;

  Supplier._();

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => name;
}
