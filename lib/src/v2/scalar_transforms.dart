mixin ScalarTransforms {
  static double doubleToJson(double value) {
    return value;
  }

  static double jsonToDouble(dynamic value) {
    return value is double
        ? value
        : (value is int
            ? value.toDouble()
            : double.tryParse(value.toString()) ?? 0.0);
  }

  static int intToJson(int value) {
    return value;
  }

  static int jsonToInt(dynamic value) {
    return value is int
        ? value
        : (value is double
            ? value.toInt()
            : int.tryParse(value.toString()) ?? 0);
  }

  static int boolToJson(int value) {
    return value;
  }

  static bool dynamicToBool(dynamic value) {
    if (value is bool) {
      return value;
    } else if (value is int) {
      return value != 0;
    } else if (value is double) {
      return value != 0.0;
    } else if (value is String) {
      return value.toLowerCase() == 'true';
    } else {
      return false;
    }
  }
}
