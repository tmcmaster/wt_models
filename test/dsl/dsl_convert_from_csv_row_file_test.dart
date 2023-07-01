import 'package:wt_logging/wt_logging.dart';

import '../dsl_test_data.dart';

void main() {
  final log = logger('DSL Convert From CsvRowFile Test', level: Level.debug);

  final testCustomer = DslTestData.customer();
  log.d('Testing data: ${testCustomer.model}');
}
