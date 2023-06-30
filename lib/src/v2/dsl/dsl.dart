import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class Dsl<T extends BaseModelV2> {
  late List<String> titles;
  final T Function(JsonMap jsonMao) jsonToModel;
  final T none;

  Dsl({
    required this.titles,
    required this.jsonToModel,
    required this.none,
  });
}
