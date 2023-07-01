import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class ToModelFromV2<T extends BaseModelV2> {
  final List<String> titles;
  final T Function(JsonMap jsonMao) jsonToModel;
  final T none;

  ToModelFromV2({
    required this.titles,
    required this.jsonToModel,
    required this.none,
  });
}
