import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/settings/presentation/views/email_otp.dart';

class KYCVerificationScreen extends ConsumerWidget {
  const KYCVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'KYC Verification',
      child: Padding(
        padding: EdgeInsets.all(24).r,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  AppTextField(
                      title: 'Enter your BVN',
                      hint: 'e.g 12133445566',
                      type: TextInputType.emailAddress),
                  20.0.spacingH,
                  AppTextField(
                      title: 'Enter your NIN',
                      hint: 'e.g 12133445566',
                      type: TextInputType.emailAddress),
                  20.0.spacingH,
                  DatePicker()
                ],
              ),
            ),
            LoadingButton(
                onPressed: () {
                  pushTo(context, EmailOtpScreen());
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
