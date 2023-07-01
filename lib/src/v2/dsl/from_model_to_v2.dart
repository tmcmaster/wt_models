import 'package:wt_models/src/base_model.dart';

class FromModelToV2<T extends BaseModel> {
  late List<String> _titles;

  FromModelToV2({
    required List<String> titles,
  }) {
    _titles = titles;
  }

  List<String> get titles => _titles;
}
