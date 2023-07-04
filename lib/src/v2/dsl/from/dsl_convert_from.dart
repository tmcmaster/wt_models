import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_to_something.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_dynamic_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_object_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/model/dsl_convert_from_model_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/model/dsl_convert_from_model_to.dart';

class DslConvertFrom<T extends BaseModel<T>> {
  final DslConvertToSomething<T, DslConvertFromModelTo<T>> model;
  final DslConvertToSomething<T, DslConvertFromModelListTo<T>> modelList;
  final DslConvertToSomething<T, DslConvertFromJsonMapTo<T>> jsonMap;
  final DslConvertToSomething<T, DslConvertFromDynamicMapTo<T>> dynamicMap;
  final DslConvertToSomething<T, DslConvertFromObjectMapTo<T>> objectMap;
  final DslConvertToSomething<T, DslConvertFromJsonMapStringTo<T>> jsonMapString;
  final DslConvertToSomething<T, DslConvertFromJsonMapFileTo<T>> jsonMapFile;
  final DslConvertToSomething<T, DslConvertFromCsvRowTo<T>> csvRow;
  final DslConvertToSomething<T, DslConvertFromCsvRowListTo<T>> csvRowList;
  final DslConvertToSomething<T, DslConvertFromCsvRowStringTo<T>> csvRowString;
  final DslConvertToSomething<T, DslConvertFromCsvRowFileTo<T>> csvRowFile;
  final DslConvertToSomething<T, DslConvertFromCsvRowListFileTo<T>> csvRowListFile;
  final DslConvertToSomething<T, DslConvertFromJsonMapListFileTo<T>> jsonMapListFile;
  DslConvertFrom(Dsl<T> dsl)
      : model = DslConvertToSomething(dsl, DslConvertFromModelTo<T>(dsl)),
        modelList = DslConvertToSomething(dsl, DslConvertFromModelListTo<T>(dsl)),
        jsonMap = DslConvertToSomething(dsl, DslConvertFromJsonMapTo<T>(dsl)),
        dynamicMap = DslConvertToSomething(dsl, DslConvertFromDynamicMapTo<T>(dsl)),
        objectMap = DslConvertToSomething(dsl, DslConvertFromObjectMapTo<T>(dsl)),
        jsonMapString = DslConvertToSomething(dsl, DslConvertFromJsonMapStringTo<T>(dsl)),
        jsonMapFile = DslConvertToSomething(dsl, DslConvertFromJsonMapFileTo<T>(dsl)),
        csvRow = DslConvertToSomething(dsl, DslConvertFromCsvRowTo<T>(dsl)),
        csvRowList = DslConvertToSomething(dsl, DslConvertFromCsvRowListTo<T>(dsl)),
        csvRowString = DslConvertToSomething(dsl, DslConvertFromCsvRowStringTo<T>(dsl)),
        csvRowFile = DslConvertToSomething(dsl, DslConvertFromCsvRowFileTo<T>(dsl)),
        csvRowListFile = DslConvertToSomething(dsl, DslConvertFromCsvRowListFileTo<T>(dsl)),
        jsonMapListFile = DslConvertToSomething(dsl, DslConvertFromJsonMapListFileTo<T>(dsl));
}
