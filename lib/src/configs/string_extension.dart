export 'string_extension.dart';

extension extString on String {
  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isLessThen8 {
    return length < 8;
  }
}




class Util {
  static bool isNullOrEmpty<T>(T? value) {
    if (value == null) {
      return true;
    }
    if (T is List<dynamic>) {
      if ((value as List<dynamic>).isEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (T is Map<dynamic, dynamic>) {
      if ((value as Map<dynamic, dynamic>).isEmpty) {
        return true;
      } else {
        return false;
      }
    } else if ((value as String).isEmpty) {
      return true;
    } else {
      return false;
    }
    //return false;
  }

  static T? nullOrHasValue<T>(List<T>? values, int index) {
    if (values == null) {
      return null;
    }
    if (values.isEmpty) {
      return null;
    }
    if (values.length - 1 < index) {
      return null;
    }
    return values[index];
  }
}
