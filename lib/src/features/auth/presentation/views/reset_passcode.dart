import '../../../../../packages.dart';
import 'phone_otp.dart';

class ResetPasscodeScreen extends ConsumerWidget {
  const ResetPasscodeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      subtitle:
          'Enter your phone number to continue, we will send you a verification code.',
      title: 'Reset your Passcode',
      onPressed: () {
        pushTo(context, PhoneOTPScreen());
      },
    );
  }
}
