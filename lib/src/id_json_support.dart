import 'package:wt_models/src/id_support.dart';
import 'package:wt_models/src/json_support.dart';

abstract class IdJsonSupport<T> with IdSupport<T>, JsonSupport {}
