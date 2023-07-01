import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';
import 'package:wt_models/src/v2/dsl/dsl_convert_to_something.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_csv_row_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_csv_row_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_csv_row_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_json_map_file_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_json_map_string_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_json_map_to.dart';
import 'package:wt_models/src/v2/dsl/from/dsl_convert_from_model_to.dart';

class DslConvertFrom<T extends BaseModelV2<T>> {
  final Dsl<T> _dsl;
  late DslConvertToSomething<T, DslConvertFromModelTo<T>> model;
  late DslConvertToSomething<T, DslConvertFromJsonMapTo<T>> jsonMap;
  late DslConvertToSomething<T, DslConvertFromJsonMapStringTo<T>> jsonMapString;
  late DslConvertToSomething<T, DslConvertFromJsonMapFileTo<T>> jsonMapFile;
  late DslConvertToSomething<T, DslConvertFromCsvRowTo<T>> csvRow;
  late DslConvertToSomething<T, DslConvertFromCsvRowStringTo<T>> csvRowString;
  late DslConvertToSomething<T, DslConvertFromCsvRowFileTo<T>> csvRowFile;
  DslConvertFrom(this._dsl) {
    model = DslConvertToSomething(_dsl, DslConvertFromModelTo<T>(_dsl));

    jsonMap = DslConvertToSomething(_dsl, DslConvertFromJsonMapTo<T>(_dsl));
    jsonMapString = DslConvertToSomething(_dsl, DslConvertFromJsonMapStringTo<T>(_dsl));
    jsonMapFile = DslConvertToSomething(_dsl, DslConvertFromJsonMapFileTo<T>(_dsl));

    csvRow = DslConvertToSomething(_dsl, DslConvertFromCsvRowTo<T>(_dsl));
    csvRowString = DslConvertToSomething(_dsl, DslConvertFromCsvRowStringTo<T>(_dsl));
    csvRowFile = DslConvertToSomething(_dsl, DslConvertFromCsvRowFileTo<T>(_dsl));
  }
}
