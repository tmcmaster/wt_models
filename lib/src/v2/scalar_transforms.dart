mixin ScalarTransforms {
  static double doubleToJson(double value) {
    return value;
  }

  static double jsonToDouble(dynamic value) {
    return value is double ? value : (value is num ? value.toDouble() : double.tryParse(value.toString()) ?? 0.0);
  }

  static int intToJson(int value) {
    return value;
  }

  static int jsonToInt(dynamic value) {
    return value is int ? value : (value is double ? value.toInt() : int.tryParse(value.toString()) ?? 0);
  }

  static num numToJson(num value) {
    return value;
  }

  static num jsonToNum(dynamic value) {
    return value is num ? value : num.tryParse(value.toString()) ?? 0;
  }

  static bool boolToJson(bool value) {
    return value;
  }

  static String dynamicToString(dynamic value) {
    return value == null ? '' : value.toString();
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
