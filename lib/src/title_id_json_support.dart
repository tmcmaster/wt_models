import 'package:wt_models/src/id_json_support.dart';
import 'package:wt_models/src/title_support.dart';

abstract class OrderTitleIdJsonSupport<T> extends TitleIdJsonSupport<T> with OrderSupport {}

abstract class TitleIdJsonSupport<T> extends IdJsonSupport<T> with TitleSupport {}

abstract class OrderSupport {
  double getOrder();
}
