import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_to_json_map_from.dart';

class DslConvertToJsonMap<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertToJsonMapFrom<T> from;
  DslConvertToJsonMap(this._dsl) {
    from = DslConvertToJsonMapFrom<T>(_dsl);
  }
}
