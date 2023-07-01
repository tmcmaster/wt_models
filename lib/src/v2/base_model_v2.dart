import 'package:wt_models/src/title_support.dart';
import 'package:wt_models/src/type_support.dart';
import 'package:wt_models/src/v2/support/csv_support_v2.dart';
import 'package:wt_models/src/v2/support/id_support_v2.dart';
import 'package:wt_models/src/v2/support/json_support_v2.dart';

abstract class BaseModelV2<T extends JsonSupportV2>
    with JsonSupportV2, CsvSupportV2, IdSupportV2, TitleSupport, TypeSupport<T> {}
