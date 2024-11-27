import 'package:payam_user/packages.dart';

class EmailOtpScreen extends ConsumerWidget {
  const EmailOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Edit Email Address',
      child: Padding(
        padding: EdgeInsets.all(24).r,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Enter Verification code',
                    style: AppTextStyle.subtitle1,
                  ),
                  Text(
                    'Enter the 6-digit Verification code sent to your Mobile Number',
                    style: AppTextStyle.formTextNatural,
                  ),
                  10.0.spacingH,
                  PinCodeField(
                    length: 6,
                  ),
                  20.0.spacingH,
                ],
              ),
            ),
            LoadingButton(
                onPressed: () {
                  pushToAndClearStack(context, ControlScreen());
                },
                child: Text(
                  'Proceed',
                  style: AppTextStyle.pryBtnStyle,
                ))
          ],
        ),
      ),
    );
  }
}
