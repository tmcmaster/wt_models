import 'package:wt_models/wt_models.dart';

class ModelTransform<T extends BaseModel<T>> {
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
