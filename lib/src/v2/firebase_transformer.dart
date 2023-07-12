import 'package:wt_models/src/v2/model_typedefs.dart';

mixin FirebaseTransformer {
  static JsonMap convertSnapshotMap(Map map) {
    return {
      for (final entry in map.entries)
        entry.key.toString(): entry.value is Map
            ? convertSnapshotMap(entry.value as Map)
            : entry.value is List
                ? convertList(entry.value as List)
                : entry.value
    };
  }

  static List<dynamic> convertList(List list) {
    return list
        .map(
          (item) => item is List
              ? convertList(item)
              : item is Map
                  ? convertSnapshotMap(item)
                  : item,
        )
        .toList();
  }
}
