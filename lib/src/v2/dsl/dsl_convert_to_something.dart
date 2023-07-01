import 'package:wt_models/src/base_model.dart';
import 'package:wt_models/src/v2/dsl/dsl.dart';

class DslConvertToSomething<T extends BaseModel<T>, TO> {
  final Dsl<T> dsl;
  late TO to;
  DslConvertToSomething(this.dsl, this.to);
}
