import '../../../../../packages.dart';
import 'phone_otp.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      subtitle:
          'Enter your phone number to continue, we will send you a verification code.',
      title: 'Welcome to ${AssetConstants.appName}',
      onPressed: () {
        pushTo(context, PhoneOTPScreen());
      },
    );
  }
}
