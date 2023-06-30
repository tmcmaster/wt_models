import 'package:wt_models/src/id_json_support.dart';
import 'package:wt_models/src/title_support.dart';
import 'package:wt_models/src/type_support.dart';

abstract class BaseModel<T> extends IdJsonSupport<T> with TitleSupport, TypeSupport<T> {}
