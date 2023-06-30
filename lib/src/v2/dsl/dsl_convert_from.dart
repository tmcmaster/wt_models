import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_from_json_map.dart';

class DslConvertFrom<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertFromJsonMap<T> jsonMap;
  DslConvertFrom(this._dsl) {
    jsonMap = DslConvertFromJsonMap<T>(_dsl);
  }
}
