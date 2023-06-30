import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';
import 'package:wt_models/src/v2/to_model/to_model_from_csv.dart';
import 'package:wt_models/src/v2/to_model/to_model_from_json.dart';

class ToModelFromV2<T extends BaseModelV2> with ToModelFromJsonV2<T>, ToModelFromCsvV2<T> {
  @override
  final List<String> titles;
  @override
  final T Function(JsonMap jsonMao) jsonToModel;
  @override
  final T none;

  ToModelFromV2({
    required this.titles,
    required this.jsonToModel,
    required this.none,
  });
}
