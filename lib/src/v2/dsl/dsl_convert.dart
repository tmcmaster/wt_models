import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_from.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_to.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

class DslConvert<T extends BaseModelV2<T>> {
  late Dsl<T> _dsl;
  late DslConvertFrom<T> from;
  late DslConvertTo<T> to;
  DslConvert({
    required List<String> titles,
    required T Function(JsonMap jsonMao) jsonToModel,
    required T none,
  }) {
    _dsl = Dsl<T>(
      titles: titles,
      jsonToModel: jsonToModel,
      none: none,
    );
    from = DslConvertFrom(_dsl);
    to = DslConvertTo(_dsl);
  }
}
