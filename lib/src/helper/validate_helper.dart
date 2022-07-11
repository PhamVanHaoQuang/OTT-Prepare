class ValidateHelper {
  static String? validatePassword(String text) {
    if (text.isEmpty) {
      return 'Vui lòng nhập mật khẩu hiện tại';
    } else if (text.length < 8) {
      return 'Mật khẩu nhập không đủ 8 kí tự';
    }
    return null;
  }

  static String? validateNewPassword(String text, String oldText) {
    if (text.isEmpty) {
      return 'Vui lòng nhập mật khẩu mới';
    } else if (text.length < 8) {
      return 'Mật khẩu nhập không đủ 8 kí tự';
    } else if (text == oldText) {
      return 'Trùng với mật khẩu hiện tại';
    }
    return null;
  }

  static String? validateConfirmPassword(String text, String newText) {
    if (text.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu mới';
    } else if (text.length < 8) {
      return 'Mật khẩu nhập không đủ 8 kí tự';
    } else if (text != newText) {
      return 'Mật khẩu nhập lại không đúng';
    }
    return null;
  }
}
