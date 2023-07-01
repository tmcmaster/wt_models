import 'package:wt_models/src/v2/base_model_v2.dart';

class FromModelToV2<T extends BaseModelV2> {
  late List<String> _titles;

  FromModelToV2({
    required List<String> titles,
  }) {
    _titles = titles;
  }

  List<String> get titles => _titles;
}
