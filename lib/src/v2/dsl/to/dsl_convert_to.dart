import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_from_something.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_json_map_file_from.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_json_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_json_map_string_from.dart';
import 'package:wt_models/src/v2/dsl/to/dsl_convert_to_model_from.dart';

class DslConvertTo<T extends BaseModel<T>> {
  final DslConvertFromSomething<T, DslConvertToModelFrom<T>> model;
  final DslConvertFromSomething<T, DslConvertToJsonMapFrom<T>> jsonMap;
  final DslConvertFromSomething<T, DslConvertToJsonMapStringFrom<T>> jsonMapString;
  final DslConvertFromSomething<T, DslConvertToJsonMapFileFrom<T>> jsonMapFile;

  DslConvertTo(Dsl<T> dsl)
      : model = DslConvertFromSomething(dsl, DslConvertToModelFrom<T>(dsl)),
        jsonMap = DslConvertFromSomething(dsl, DslConvertToJsonMapFrom<T>(dsl)),
        jsonMapString = DslConvertFromSomething(dsl, DslConvertToJsonMapStringFrom<T>(dsl)),
        jsonMapFile = DslConvertFromSomething(dsl, DslConvertToJsonMapFileFrom<T>(dsl));
}
