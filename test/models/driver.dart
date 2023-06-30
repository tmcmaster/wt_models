import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/from_model_to.dart';
import 'package:wt_models/src/to_model_from.dart';

import 'customer.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
class Driver extends BaseModel<Driver> with _$Driver {
  static final from = ToModelFrom<Driver>(json: _Driver.fromJson, titles: _titles);
  static final to = FromModelTo<Driver>(titles: _titles);

  static final _titles = ['id', 'name', 'phone'];

  factory Driver({
    required String id,
    required String name,
    required String phone,
  }) = _Driver;

  Driver._();

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => name;
}
