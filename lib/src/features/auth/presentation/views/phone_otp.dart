
import '../../../../../packages.dart';

class PhoneOTPScreen extends ConsumerWidget {
  const PhoneOTPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBody(
      title: 'Enter Verification Code',
      subTitle:
          'Enter your the 6-digit Verification code sent to your Mobile Number 081XXXXXXXX',
      child: Expanded(
        child: Column(
          children: [
            // AppPhoneField(),
            PinCodeField(),
            Text(
              'Resend 1:00',
              style: AppTextStyle.bodyText2,
            ),
            Spacer(),
            LoadingButton(
                onPressed: () {
                  pushTo(context, CreateProfileScreen());
                },
                child: Text('Proceed', style: AppTextStyle.pryBtnStyle))
          ],
        ),
      ),
    );
  }
}
