import 'package:wt_models/src/csv_support.dart';
import 'package:wt_models/src/id_support.dart';
import 'package:wt_models/src/json_support.dart';
import 'package:wt_models/src/title_support.dart';
import 'package:wt_models/src/type_support.dart';

// TODO: need to look at converting this to a mixing, considering the migration of dependent external code.
abstract class BaseModel<T>
    with IdSupport<T>, JsonSupport, TitleSupport, TypeSupport<T>, CsvSupport {
  const BaseModel();
}
