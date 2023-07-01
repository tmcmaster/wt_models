import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';

class DslConvertFromSomething<T extends BaseModelV2<T>, FROM> {
  final Dsl<T> dsl;
  final FROM from;
  DslConvertFromSomething(this.dsl, this.from);
}
