import 'dart:io';

import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

mixin ToModelFromCsvV2<T extends BaseModelV2> {
  List<String> get titles;
  T Function(JsonMap jsonMao) get jsonToModel;
  T get none;

  T csvRowToModel(CsvRow csvRow) {
    final jsonMap = {
      for (var i = 0; i < titles.length; i++) titles[i]: csvRow[i] == '' ? null : csvRow[i]
    };
    return jsonToModel(jsonMap);
  }

  T csvRowStringToModel(String csvRowString) {
    final csvRowList = fromCsvString(csvRowString);
    return csvRowList.isEmpty ? none : csvRowToModel(csvRowList[0]);
  }

  T csvRowFileToModel(File file) {
    return csvRowStringToModel(file.readAsStringSync());
  }

  List<T> csvRowListToModelList(List<CsvRow> csvList) {
    return csvList.map((csv) => csvRowToModel(csv)).toList();
  }

  List<T> csvListStringToModeList(String csvString) {
    return csvRowListToModelList(
      fromCsvString(csvString, eol: '\n').sublist(1),
    );
  }

  List<T> csvRowListFileToModelList(File file) {
    return csvListStringToModeList(file.readAsStringSync());
  }
}
