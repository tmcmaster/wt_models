import 'dart:io';

import 'package:wt_models/src/title_support.dart';
import 'package:wt_models/src/type_support.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';
import 'package:wt_models/src/v2/support/csv_support_v2.dart';
import 'package:wt_models/src/v2/support/id_support_v2.dart';
import 'package:wt_models/src/v2/support/json_support_v2.dart';

abstract class BaseModelV2<T extends JsonSupportV2>
    with JsonSupportV2, CsvSupportV2, IdSupportV2, TitleSupport, TypeSupport<T> {
  JsonMap toJsonMap() => throw Exception('The toJsonMap function not implemented.');
  String toJsonMapString() => throw Exception('The toJsonMapString function not implemented.');
  void toJsonMapFile(File file) => throw Exception('The toJsonMapFile function not implemented.');
  CsvRow toCsvRow() => throw Exception('The toCsvRow function not implemented.');
  CsvRow toCsvRowString() => throw Exception('The toCsvRowString function not implemented.');
  CsvRow toCsvRowFile() => throw Exception('The toCsvRowFile function not implemented.');
}
