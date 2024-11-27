import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/settings/presentation/views/pin_screen.dart';

class ChangeTransactionPinScreen extends ConsumerWidget {
  const ChangeTransactionPinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Change Transaction Pin',
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
                  pushToAndClearStack(context, PinScreen());
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
