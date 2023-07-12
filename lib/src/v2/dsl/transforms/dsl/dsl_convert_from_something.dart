import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/transforms/dsl/dsl.dart';

class DslConvertFromSomething<T extends BaseModel<T>, FROM> {
  final Dsl<T> dsl;
  final FROM from;
  DslConvertFromSomething(this.dsl, this.from);
}
