import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_list_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/csv_row/dsl_convert_from_csv_row_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_list_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/dynamic_map/dsl_convert_from_dynamic_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_list_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/json_map/dsl_convert_from_json_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/model/dsl_convert_from_model_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/model/dsl_convert_from_model_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_obejct_map_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_obejct_map_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_object_map_list_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_object_map_list_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_object_map_list_to.dart';
import 'package:wt_models/src/v2/dsl/from/object_map/dsl_convert_from_object_map_to.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl_convert_to_something.dart';

class DslConvertFrom<T extends BaseModel<T>> {
  final DslConvertToSomething<T, DslConvertFromModelTo<T>> model;
  final DslConvertToSomething<T, DslConvertFromModelListTo<T>> modelList;

  final DslConvertToSomething<T, DslConvertFromJsonMapTo<T>> jsonMap;
  final DslConvertToSomething<T, DslConvertFromJsonMapStringTo<T>> jsonMapString;
  final DslConvertToSomething<T, DslConvertFromJsonMapFileTo<T>> jsonMapFile;
  final DslConvertToSomething<T, DslConvertFromJsonMapListTo<T>> jsonMapList;
  final DslConvertToSomething<T, DslConvertFromJsonMapListStringTo<T>> jsonMapListString;
  final DslConvertToSomething<T, DslConvertFromJsonMapListFileTo<T>> jsonMapListFile;

  final DslConvertToSomething<T, DslConvertFromDynamicMapTo<T>> dynamicMap;
  final DslConvertToSomething<T, DslConvertFromDynamicMapStringTo<T>> dynamicMapString;
  final DslConvertToSomething<T, DslConvertFromDynamicMapFileTo<T>> dynamicMapFile;
  final DslConvertToSomething<T, DslConvertFromDynamicMapListTo<T>> dynamicMapList;
  final DslConvertToSomething<T, DslConvertFromDynamicMapListStringTo<T>> dynamicMapListString;
  final DslConvertToSomething<T, DslConvertFromDynamicMapListFileTo<T>> dynamicMapListFile;

  final DslConvertToSomething<T, DslConvertFromObjectMapTo<T>> objectMap;
  final DslConvertToSomething<T, DslConvertFromObjectMapStringTo<T>> objectMapString;
  final DslConvertToSomething<T, DslConvertFromObjectMapFileTo<T>> objectMapFile;
  final DslConvertToSomething<T, DslConvertFromObjectMapListTo<T>> objectMapList;
  final DslConvertToSomething<T, DslConvertFromObjectMapListStringTo<T>> objectMapListString;
  final DslConvertToSomething<T, DslConvertFromObjectMapListFileTo<T>> objectMapListFile;

  final DslConvertToSomething<T, DslConvertFromCsvRowTo<T>> csvRow;
  final DslConvertToSomething<T, DslConvertFromCsvRowStringTo<T>> csvRowString;
  final DslConvertToSomething<T, DslConvertFromCsvRowFileTo<T>> csvRowFile;
  final DslConvertToSomething<T, DslConvertFromCsvRowListTo<T>> csvRowList;
  final DslConvertToSomething<T, DslConvertFromCsvRowListStringTo<T>> csvRowListString;
  final DslConvertToSomething<T, DslConvertFromCsvRowListFileTo<T>> csvRowListFile;

  DslConvertFrom(Dsl<T> dsl)
      : model = DslConvertToSomething(dsl, DslConvertFromModelTo<T>(dsl)),
        modelList = DslConvertToSomething(dsl, DslConvertFromModelListTo<T>(dsl)),
        jsonMap = DslConvertToSomething(dsl, DslConvertFromJsonMapTo<T>(dsl)),
        jsonMapString = DslConvertToSomething(dsl, DslConvertFromJsonMapStringTo<T>(dsl)),
        jsonMapFile = DslConvertToSomething(dsl, DslConvertFromJsonMapFileTo<T>(dsl)),
        jsonMapList = DslConvertToSomething(dsl, DslConvertFromJsonMapListTo<T>(dsl)),
        jsonMapListString = DslConvertToSomething(dsl, DslConvertFromJsonMapListStringTo<T>(dsl)),
        jsonMapListFile = DslConvertToSomething(dsl, DslConvertFromJsonMapListFileTo<T>(dsl)),
        dynamicMap = DslConvertToSomething(dsl, DslConvertFromDynamicMapTo<T>(dsl)),
        dynamicMapString = DslConvertToSomething(dsl, DslConvertFromDynamicMapStringTo<T>(dsl)),
        dynamicMapFile = DslConvertToSomething(dsl, DslConvertFromDynamicMapFileTo<T>(dsl)),
        dynamicMapList = DslConvertToSomething(dsl, DslConvertFromDynamicMapListTo<T>(dsl)),
        dynamicMapListString =
            DslConvertToSomething(dsl, DslConvertFromDynamicMapListStringTo<T>(dsl)),
        dynamicMapListFile = DslConvertToSomething(dsl, DslConvertFromDynamicMapListFileTo<T>(dsl)),
        objectMap = DslConvertToSomething(dsl, DslConvertFromObjectMapTo<T>(dsl)),
        objectMapString = DslConvertToSomething(dsl, DslConvertFromObjectMapStringTo<T>(dsl)),
        objectMapFile = DslConvertToSomething(dsl, DslConvertFromObjectMapFileTo<T>(dsl)),
        objectMapList = DslConvertToSomething(dsl, DslConvertFromObjectMapListTo<T>(dsl)),
        objectMapListString =
            DslConvertToSomething(dsl, DslConvertFromObjectMapListStringTo<T>(dsl)),
        objectMapListFile = DslConvertToSomething(dsl, DslConvertFromObjectMapListFileTo<T>(dsl)),
        csvRow = DslConvertToSomething(dsl, DslConvertFromCsvRowTo<T>(dsl)),
        csvRowString = DslConvertToSomething(dsl, DslConvertFromCsvRowStringTo<T>(dsl)),
        csvRowFile = DslConvertToSomething(dsl, DslConvertFromCsvRowFileTo<T>(dsl)),
        csvRowList = DslConvertToSomething(dsl, DslConvertFromCsvRowListTo<T>(dsl)),
        csvRowListString = DslConvertToSomething(dsl, DslConvertFromCsvRowListStringTo<T>(dsl)),
        csvRowListFile = DslConvertToSomething(dsl, DslConvertFromCsvRowListFileTo<T>(dsl));
}
