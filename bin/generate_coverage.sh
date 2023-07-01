#!/bin/zsh

CSS_FILE="bin/generate_coverage/style.css";
LCOV_IN="coverage/lcov.info";
LCOV_OUT="coverage/new_lcov.info";
HTML_OUT="coverage/html";
ALL_FILES_TEST_FILE="test/all_files_import_test.dart";

find lib -name '*.dart' |\
grep -E -v '.*/*.g.dart|.*/*.freezed.dart|.*/*.mocks.dart|.*/models/*.dart|.*/models/.*/*.dart|.*/*_view.dart|.*/*_page.dart|.*/widgets/*.dart|.*/widgets/.*/*.dart|lib/apps/.*|lib/secrets/.*|lib/testing/.*|lib/common/lottie/.*' |\
awk -F 'lib/' '{printf("import %spackage:wix_admin/%s%s;\n", "\"",$2,"\"")} END {print "void main() {}"}' \
> ${ALL_FILES_TEST_FILE}

flutter test --coverage;

lcov --remove ${LCOV_IN} '**/*.g.dart' '**/*.freezed.dart' '**/*.mocks.dart' '**/models/*.dart' '**/models/**/*.dart' '**/*_view.dart' '**/*_page.dart' '**/widgets/*.dart' '**/widgets/**/*.dart' 'lib/apps/**' 'lib/secrets/**' 'lib/testing/**' 'lib/common/lottie/**' -o ${LCOV_OUT} |\
grep -v '^Removing ';

genhtml --no-function-coverage --prefix "$(pwd)" --css-file ${CSS_FILE} ${LCOV_OUT} -o ${HTML_OUT} |\
grep -v '^Processing file';

rm ${ALL_FILES_TEST_FILE}
