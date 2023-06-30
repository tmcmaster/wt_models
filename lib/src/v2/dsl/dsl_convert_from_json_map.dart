import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_from_json_map_to.dart';

class DslConvertFromJsonMap<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertFromJsonMapTo<T> to;
  DslConvertFromJsonMap(this._dsl) {
    to = DslConvertFromJsonMapTo<T>(_dsl);
  }
}
