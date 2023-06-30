import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_to_json_map.dart';

class DslConvertTo<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertToJsonMap<T> jsonMap;
  DslConvertTo(this._dsl) {
    jsonMap = DslConvertToJsonMap<T>(_dsl);
  }

  List<String> title() => _dsl.titles;
}
