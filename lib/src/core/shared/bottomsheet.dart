import 'dart:ui';

import 'package:payam_user/src/core/shared/transaction_pin.dart';

import '../../../packages.dart';

Future<dynamic> bottomSheet(BuildContext context, Widget child,
    [bool isDimiss = true, bool isScrollable = true]) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollable,
    isDismissible: isDimiss,
    backgroundColor: AppColors.transparent,
    builder: (context) => SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        child: child,
      ),
    ),
  );
}

showTranSuccessModel(
  BuildContext context,
  String message,
  details, [
  VoidCallback? onPressed,
  String buttonText = 'View Details',
  String icon = AssetConstants.success,
  bool isDismissed = false,
  bool isScroll = false,
]) {
  bottomSheet(
      context,
      Container(
        height: 450.h,
        width: double.infinity,
        padding: EdgeInsets.all(25).r,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20).r,
            topLeft: Radius.circular(20).r,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0).r,
              child: BottomSheetDivider(),
            ),
            Spacer(),
            SvgWidget(
              AssetConstants.success,
              height: 100.h,
            ),
            10.0.spacingH,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.headline2
                  .copyWith(fontWeight: AppFontWeight.semiBold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50).r,
              child: Text(
                details,
                textAlign: TextAlign.center,
                style: AppTextStyle.formText,
              ),
            ),
            Spacer(),
            // 10.0.spacingH,
            LoadingButton(
              child: Text(
                buttonText,
                style: AppTextStyle.pryBtnStyle,
              ),
              isLoading: false,
              onPressed: () {
                pop(context);
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
            10.0.spacingH,
            TextButton(
                onPressed: () {
                  pushToAndClearStack(context, ControlScreen());
                  // pop(context);
                },
                child: Text(
                  'Return to Home',
                  style: AppTextStyle.secBtnStyle,
                )),
            5.0.spacingH
          ],
        ),
      ),
      isDismissed,
      isScroll);
}

showPinModel(
  BuildContext context,
  VoidCallback onDone,
  String amount,
) {
  return bottomSheet(
      context, TransactionPinModal(onDone: onDone, amount: amount));
}
