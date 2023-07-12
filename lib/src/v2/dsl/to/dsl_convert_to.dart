import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_dynamic_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_file_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_string_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_object_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/model/dsl_convert_to_model_from.dart';
import 'package:wt_models/src/v2/dsl/to/model/dsl_convert_to_model_list_from.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl_convert_from_something.dart';

class DslConvertTo<T extends BaseModel<T>> {
  final DslConvertFromSomething<T, DslConvertToModelFrom<T>> model;
  final DslConvertFromSomething<T, DslConvertToModelListFrom<T>> modelList;
  final DslConvertFromSomething<T, DslConvertToJsonMapFrom<T>> jsonMap;
  final DslConvertFromSomething<T, DslConvertToDynamicMapFrom<T>> dynamicMap;
  final DslConvertFromSomething<T, DslConvertToObjectMapFrom<T>> objectMap;
  final DslConvertFromSomething<T, DslConvertToJsonMapStringFrom<T>> jsonMapString;
  final DslConvertFromSomething<T, DslConvertToJsonMapFileFrom<T>> jsonMapFile;

  DslConvertTo(Dsl<T> dsl)
      : model = DslConvertFromSomething(dsl, DslConvertToModelFrom<T>(dsl)),
        modelList = DslConvertFromSomething(dsl, DslConvertToModelListFrom<T>(dsl)),
        jsonMap = DslConvertFromSomething(dsl, DslConvertToJsonMapFrom<T>(dsl)),
        dynamicMap = DslConvertFromSomething(dsl, DslConvertToDynamicMapFrom<T>(dsl)),
        objectMap = DslConvertFromSomething(dsl, DslConvertToObjectMapFrom<T>(dsl)),
        jsonMapString = DslConvertFromSomething(dsl, DslConvertToJsonMapStringFrom<T>(dsl)),
        jsonMapFile = DslConvertFromSomething(dsl, DslConvertToJsonMapFileFrom<T>(dsl));
}
