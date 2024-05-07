import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../packages.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {Key? key,
      required this.itemsList,
      required this.hintText,
      this.fillColor,
      this.onChange,
      this.hintStyle,
      this.title,
      this.prefIcon,
      required this.firstItem,
      this.borderColor})
      : super(key: key);

  final List itemsList;
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final String firstItem;
  final TextStyle? hintStyle;
  final String? title;
  final Widget? prefIcon;

  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? '',
            style: AppTextStyle.caption.copyWith(
                fontWeight: AppFontWeight.regular, color: AppColors.natural),
          ),
        if (title != null) 5.0.spacingH,
        DropdownButtonFormField2<String>(
          isDense: true,
          value: firstItem,
          // barrierColor: AppColors.appBlue,
          menuItemStyleData: MenuItemStyleData(),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: fillColor ?? Colors.white,
            // fillColor: AppColors.red,
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.primary, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.primary, width: 0.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.primary, width: 0.5)),
          ),
          isExpanded: true,
          // barrierColor: AppColors.red,

          hint: Text(hintText, style: hintStyle ?? AppTextStyle.formText),
          items: itemsList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppTextStyle.bodyText1,
                    ),
                  ))
              .toList(),
          onChanged: onChange,
          buttonStyleData: ButtonStyleData(
            height: 65.h,
            // overlayColor: MaterialStateProperty.all(Colors.red),

            padding: EdgeInsets.only(left: 0, right: 10),
          ),
          iconStyleData: IconStyleData(
            icon: prefIcon ??
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black45,
                ),
            iconSize: 30,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10).r,
            ),
          ),
        ),
      ],
    );
  }
}

// class CustomDropDown2 extends StatelessWidget {
//   const CustomDropDown2(
//       {Key? key,
//       required this.itemsList,
//       required this.hintText,
//       this.fillColor,
//       this.onChange,
//       this.hintStyle,
//       required this.firstItem,
//       this.borderColor})
//       : super(key: key);

//   final List<Currency> itemsList;
//   final String hintText;
//   final Color? fillColor;
//   final Color? borderColor;
//   final Currency firstItem;
//   final TextStyle? hintStyle;

//   final Function(Currency?)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField2<Currency>(
//       isDense: true,
//       value: firstItem,
//       // barrierColor: AppColors.appBlue,
//       menuItemStyleData: MenuItemStyleData(),
//       decoration: InputDecoration(
//         isDense: true,
//         filled: true,
//         fillColor: fillColor ?? Colors.white,
//         // fillColor: AppColors.red,
//         contentPadding: EdgeInsets.zero,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.darkGray, width: 0.5)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.primary, width: 0.5)),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.appDark, width: 0.8)),
//       ),
//       isExpanded: true,
//       // barrierColor: AppColors.red,

//       hint: Text(hintText, style: hintStyle ?? AppTextStyle.formText),
//       items: itemsList
//           .map((item) => DropdownMenuItem<Currency>(
//                 value: item,
//                 child: Row(
//                   children: [
//                     ImageWidget(item.code),
//                     10.0.spacingW,
//                     Text(
//                       item.title,
//                       style: AppTextStyle.bodyText1,
//                     ),
//                   ],
//                 ),
//               ))
//           .toList(),
//       onChanged: onChange,
//       buttonStyleData: ButtonStyleData(
//         height: 50,
//         // overlayColor: MaterialStateProperty.all(Colors.red),

//         padding: EdgeInsets.only(left: 0, right: 10),
//       ),
//       iconStyleData: const IconStyleData(
//         icon: Icon(
//           Icons.keyboard_arrow_down,
//           color: Colors.black45,
//         ),
//         iconSize: 30,
//       ),
//       dropdownStyleData: DropdownStyleData(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(10).r,
//         ),
//       ),
//     );
//   }
// }
