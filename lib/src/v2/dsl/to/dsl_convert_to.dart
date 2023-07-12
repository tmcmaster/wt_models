import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/to/csv_row/dsl_convert_to_csv_row_list_file_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_dynamic_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_file_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_from.dart';
import 'package:wt_models/src/v2/dsl/to/json_map/dsl_convert_to_json_map_list_file_from.dart';
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
  final DslConvertFromSomething<T, DslConvertToJsonMapStringFrom<T>> jsonMapString;
  final DslConvertFromSomething<T, DslConvertToJsonMapFileFrom<T>> jsonMapFile;
  // final DslConvertFromSomething<T, DslConvertToJsonMapListFrom<T>> jsonMapList;
  // final DslConvertFromSomething<T, DslConvertToJsonMapListStringFrom<T>> jsonMapListString;
  final DslConvertFromSomething<T, DslConvertToJsonMapListFileFrom<T>> jsonMapListFile;

  final DslConvertFromSomething<T, DslConvertToDynamicMapFrom<T>> dynamicMap;
  // final DslConvertFromSomething<T, DslConvertToDynamicMapStringFrom<T>> dynamicMapString;
  // final DslConvertFromSomething<T, DslConvertToDynamicMapFileFrom<T>> dynamicMapFile;
  // final DslConvertFromSomething<T, DslConvertToDynamicMapListFrom<T>> dynamicMapList;
  // final DslConvertFromSomething<T, DslConvertToDynamicMapListStringFrom<T>> dynamicMapListString;
  // final DslConvertFromSomething<T, DslConvertToDynamicMapListFileFrom<T>> dynamicMapListFile;

  final DslConvertFromSomething<T, DslConvertToObjectMapFrom<T>> objectMap;
  // final DslConvertFromSomething<T, DslConvertToObjectMapStringFrom<T>> objectMapString;
  // final DslConvertFromSomething<T, DslConvertToObjectMapFileFrom<T>> objectMapFile;
  // final DslConvertFromSomething<T, DslConvertToObjectMapListFrom<T>> objectMapList;
  // final DslConvertFromSomething<T, DslConvertToObjectMapListStringFrom<T>> objectMapListString;
  // final DslConvertFromSomething<T, DslConvertToObjectMapListFileFrom<T>> objectMapListFile;

  // final DslConvertFromSomething<T, DslConvertToCsvRowFrom<T>> csvRow;
  // final DslConvertFromSomething<T, DslConvertToCsvRowStringFrom<T>> csvRowString;
  // final DslConvertFromSomething<T, DslConvertToOCsvRowFileFrom<T>> csvRowFile;
  // final DslConvertFromSomething<T, DslConvertToCsvRowListFrom<T>> csvRowList;
  // final DslConvertFromSomething<T, DslConvertToCsvRowListStringFrom<T>> csvRowListString;
  final DslConvertFromSomething<T, DslConvertToCsvRowListFileFrom<T>> csvRowListFile;

  DslConvertTo(Dsl<T> dsl)
      : model = DslConvertFromSomething(dsl, DslConvertToModelFrom<T>(dsl)),
        modelList = DslConvertFromSomething(dsl, DslConvertToModelListFrom<T>(dsl)),
        jsonMap = DslConvertFromSomething(dsl, DslConvertToJsonMapFrom<T>(dsl)),
        jsonMapString = DslConvertFromSomething(dsl, DslConvertToJsonMapStringFrom<T>(dsl)),
        jsonMapFile = DslConvertFromSomething(dsl, DslConvertToJsonMapFileFrom<T>(dsl)),
        // jsonMapList = DslConvertFromSomething(dsl, DslConvertToJsonMapListFrom<T>(dsl)),
        // jsonMapListString = DslConvertFromSomething(dsl, DslConvertToJsonMapListStringFrom<T>(dsl)),
        jsonMapListFile = DslConvertFromSomething(dsl, DslConvertToJsonMapListFileFrom<T>(dsl)),
        dynamicMap = DslConvertFromSomething(dsl, DslConvertToDynamicMapFrom<T>(dsl)),
        // dynamicMapString = DslConvertFromSomething(dsl, DslConvertToDynamicMapStringFrom<T>(dsl)),
        // dynamicMapFile = DslConvertFromSomething(dsl, DslConvertToDynamicMapFileFrom<T>(dsl)),
        // dynamicMapList = DslConvertFromSomething(dsl, DslConvertToDynamicMapListFrom<T>(dsl)),
        // dynamicMapListString = DslConvertFromSomething(dsl, DslConvertToDynamicMapListStringFrom<T>(dsl)),
        // dynamicMapListFile = DslConvertFromSomething(dsl, DslConvertToMapListFileFrom<T>(dsl)),
        objectMap = DslConvertFromSomething(dsl, DslConvertToObjectMapFrom<T>(dsl)),
        // objectMapString = DslConvertFromSomething(dsl, DslConvertToObjectMapStringFrom<T>(dsl)),
        // objectMapFile = DslConvertFromSomething(dsl, DslConvertToObjectMapFileFrom<T>(dsl)),
        // objectMapList = DslConvertFromSomething(dsl, DslConvertToObjectMapListFrom<T>(dsl)),
        // objectMapListString = DslConvertFromSomething(dsl, DslConvertToObjectMapListStringFrom<T>(dsl)),
        // objectMapListFile = DslConvertFromSomething(dsl, DslConvertToObjectMapListFileFrom<T>(dsl)),
        // csvRow = DslConvertFromSomething(dsl, DslConvertToCsvRowFrom<T>(dsl)),
        // csvRowString = DslConvertFromSomething(dsl, DslConvertToCsvRowStringFrom<T>(dsl)),
        // csvRowFile = DslConvertFromSomething(dsl, DslConvertToCsvRowFileFrom<T>(dsl)),
        // csvRowList = DslConvertFromSomething(dsl, DslConvertToOCsvRowListFrom<T>(dsl)),
        // csvRowListString = DslConvertFromSomething(dsl, DslConvertToCsvRowListStringFrom<T>(dsl)),
        csvRowListFile = DslConvertFromSomething(dsl, DslConvertToCsvRowListFileFrom<T>(dsl));
}
