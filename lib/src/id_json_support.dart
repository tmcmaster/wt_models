import 'id_support.dart';
import 'json_support.dart';

abstract class IdJsonSupport<T> extends JsonSupport with IdSupport<T> {}
