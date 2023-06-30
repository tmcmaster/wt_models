import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/from_model/from_model_to_csv.dart';
import 'package:wt_models/src/v2/from_model/from_model_to_json.dart';

class FromModelToV2<T extends BaseModelV2> with FromModelToJsonV2<T>, FromModelToCsvV2<T> {
  late List<String> _titles;

  FromModelToV2({
    required List<String> titles,
  }) {
    _titles = titles;
  }

  @override
  List<String> get titles => _titles;
}
