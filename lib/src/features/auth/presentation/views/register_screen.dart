import '../../../../../packages.dart';
import 'phone_otp.dart';

class RegisterScreen extends ConsumerWidget {
   RegisterScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      controller: controller,
      subtitle:
          'Enter your phone number to continue, we will send you a verification code.',
      title: 'Welcome to ${AssetConstants.appName}',
      onPressed: () {
        ref.read(authControllerProvider.notifier).sendSMSOTP(context, controller.text.trim());
        // pushTo(context, PhoneOTPScreen());
      },
    );
  }
}
