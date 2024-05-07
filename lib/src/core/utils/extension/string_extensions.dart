extension StringExtensions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\_$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'^\+?0[0-9]{10}$');
    return phoneRegExp.hasMatch(this);
  }
}

extension Base64Converter on String {
  String get toBase64 => this.replaceAll(
      RegExp(r'^(data:image/[a-z]+;base64,)', caseSensitive: false), '');
}
