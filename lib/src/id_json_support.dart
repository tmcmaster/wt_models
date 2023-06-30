import 'package:wt_models/src/id_support.dart';
import 'package:wt_models/src/json_support.dart';

abstract class IdJsonSupport<T> extends JsonSupport with IdSupport<T> {}
