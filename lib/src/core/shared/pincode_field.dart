import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../packages.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    this.height = 50,
    this.width,
    this.length = 6,
    this.radius = 10,
    this.readOnly = false,
    this.obscure = false,
    this.controller,
    this.onChanged,
    this.onCompleted,
    Key? key,
  }) : super(key: key);
  final int length;
  final double height;
  final double? width;
  final double radius;
  final bool readOnly;
  final bool obscure;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<AuthProvider>(
    //   context,
    // );
    return PinCodeTextField(
      appContext: context,
      length: length,
      cursorColor: AppColors.black54,
      // backgroundColor: AppColors.black54,
      enablePinAutofill: true,
      enableActiveFill: true,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscure,
      obscuringCharacter: '\u2B24',
      obscuringWidget: obscure
          ? Container(
              height: 15.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
            )
          : null,
      keyboardType: TextInputType.number,
      autoDisposeControllers: true,
      textStyle: AppTextStyle.headline2,
      pinTheme: PinTheme.defaults(
          fieldHeight: height.h,
          fieldWidth: width?.w ?? height.w,
          borderWidth: 0.3,
          activeColor: AppColors.gray,
          selectedColor: AppColors.primary,
          inactiveFillColor: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          selectedFillColor: AppColors.white,
          inactiveColor: AppColors.gray,
          activeFillColor: AppColors.white,
          shape: PinCodeFieldShape.box),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}

class TransPinCodeField extends StatelessWidget {
  const TransPinCodeField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<AuthProvider>(
    //   context,
    // );
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: AppColors.black54,
      // backgroundColor: AppColors.black54,
      enablePinAutofill: true,
      enableActiveFill: true,
      obscuringWidget: Container(
        height: 15.h,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      ),
      keyboardType: TextInputType.number,
      pinTheme: PinTheme.defaults(
          fieldHeight: 70.h,
          fieldWidth: 70.w,
          borderWidth: 0.3,
          activeColor: AppColors.gray,
          selectedColor: AppColors.gray,
          inactiveFillColor: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          selectedFillColor: AppColors.white,
          inactiveColor: AppColors.gray,
          activeFillColor: AppColors.white,
          shape: PinCodeFieldShape.box),
      onChanged: (va) {},
    );
  }
}
