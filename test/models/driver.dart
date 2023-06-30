import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_transform.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
class Driver extends BaseModelV2<Driver> with _$Driver {
  static final convert = ModelTransform<Driver>(
    titles: ['id', 'name', 'phone'],
    jsonToModel: Driver.fromJson,
    none: Driver.empty(),
  );

  factory Driver({
    required String id,
    required String name,
    required String phone,
  }) = _Driver;

  Driver._();

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  factory Driver.empty() => Driver(
        id: '',
        name: '',
        phone: ',',
      );

  @override
  String getId() => id;

  @override
  String getTitle() => name;

  @override
  List<String> getTitles() => convert.to.titles;
}
