import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';

class DslConvertToSomething<T extends BaseModelV2<T>, TO> {
  final Dsl<T> _dsl;
  late TO to;
  DslConvertToSomething(this._dsl, this.to);
}
