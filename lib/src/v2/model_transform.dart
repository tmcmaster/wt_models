import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/from_model/from_model_to_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';
import 'package:wt_models/src/v2/to_model/to_model_from_v2.dart';

class ModelTransform<T extends BaseModelV2<T>> {
  late FromModelToV2<T> to;
  late ToModelFromV2<T> from;

  ModelTransform({
    required List<String> titles,
    required T Function(JsonMap jsonMao) jsonToModel,
    required T none,
  }) {
    from = ToModelFromV2<T>(
      titles: titles,
      jsonToModel: jsonToModel,
      none: none,
    );

    to = FromModelToV2<T>(
      titles: titles,
    );
  }
}
