import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool get isValidEmail {
    // final emailRegExp = RegExp(r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    // name.isNotEmpty && RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$').hasMatch(name);
    final nameRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$');
    return this.isNotEmpty && nameRegExp.hasMatch(this);
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

  bool get isStrongPassword {
    final RegExp upperCaseRegex = RegExp(r'[A-Z]');
    final RegExp lowerCaseRegex = RegExp(r'[a-z]');
    final RegExp digitRegex = RegExp(r'\d');
    final RegExp specialCharRegex =
        RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\/-]');

    // Check if the password meets the required criteria
    bool hasUpperCase = upperCaseRegex.hasMatch(this);
    bool hasLowerCase = lowerCaseRegex.hasMatch(this);
    bool hasDigit = digitRegex.hasMatch(this);
    bool hasSpecialChar = specialCharRegex.hasMatch(this);
    bool isLengthValid = this.length >= 8;
    return hasUpperCase &&
        hasLowerCase &&
        hasDigit &&
        hasSpecialChar &&
        isLengthValid;
  }
}

extension Base64Converter on String {
  String get toBase64 => this.replaceAll(
      RegExp(r'^(data:image/[a-z]+;base64,)', caseSensitive: false), '');
}

extension Currency on num {
  String toCurrency({dec = 2}) {
    var d = double.parse(this.toString());
    return NumberFormat.currency(symbol: '', decimalDigits: dec).format(d);
  }
}

extension FormatDate on DateTime {
  String toSplashForm() {
    return '${this.year}-${this.month.toString().length == 1 ? '0${this.month}' : this.month}-${this.day.toString().length == 1 ? '0${this.day}' : this.day}';
  }

  String toSplashFormRe() {
    return '${this.month.toString().length == 1 ? '0${this.month}' : this.month}/${this.day.toString().length == 1 ? '0${this.day}' : this.day}/${this.year}';
  }
}

extension MoneyFormat on String {
  String? formatAsMoney() {
    final formatter = NumberFormat("#,##0.00", "en_US");
    try {
      final number = double.parse(this);
      return formatter.format(number);
    } catch (e) {
      print('Error formatting money: $e');
      return null;
    }
  }
}