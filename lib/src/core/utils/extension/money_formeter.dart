import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class CustomMoneyFormat {
final formatCurrency = new NumberFormat.simpleCurrency();
  
 static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return '';
  }
}



class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}


class DecimalFormatter extends TextInputFormatter {
  final int decimalDigits;

  DecimalFormatter({this.decimalDigits = 2}) : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, 
    TextEditingValue newValue,) {

      String newText;

      if (decimalDigits == 0) {
        newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
      }
      else {
        newText = newValue.text.replaceAll(RegExp('[^0-9\.]'), '');
      }

      if(newText.contains('.')) {
        //in case if user's first input is "."
        if (newText.trim() == '.') {
          return newValue.copyWith(
            text: '0.',
            selection: TextSelection.collapsed(offset: 2),
          );
        }
        //in case if user tries to input multiple "."s or tries to input 
        //more than the decimal place
        else if (
          (newText.split(".").length > 2) 
          || (newText.split(".")[1].length > this.decimalDigits)
        ) {
          return oldValue;
        }
        else return newValue;
      }

      //in case if input is empty or zero
      if (newText.trim() == '' || newText.trim() == '0') {
        return newValue.copyWith(text: '');
      } 
      else if (int.parse(newText) < 1) {
        return newValue.copyWith(text: '');
      }

      double newDouble = double.parse(newText);
      var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;

      String newString = NumberFormat("#,##0.##").format(newDouble);

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    }
}