import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_typedefs.dart';

mixin FromModelToCsvV2<M extends BaseModelV2> {
  List<String> get titles;

  CsvRow csvRowFromModel(M model) {
    final json = model.toJson();
    final List<String> titles = model.getTitles();
    return titles.map((title) => json[title]).toList();
  }
}
