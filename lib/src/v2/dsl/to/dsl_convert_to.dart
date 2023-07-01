import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_from_something.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_json_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_model_from.dart';

class DslConvertTo<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertFromSomething<T, DslConvertToJsonMapFrom<T>> jsonMap;
  late DslConvertFromSomething<T, DslConvertToModelFrom<T>> model;

  DslConvertTo(this._dsl) {
    jsonMap = DslConvertFromSomething(_dsl, DslConvertToJsonMapFrom<T>(_dsl));
    model = DslConvertFromSomething(_dsl, DslConvertToModelFrom<T>(_dsl));
  }

  List<String> title() => _dsl.titles;
}
