import '../../../../../packages.dart';

class ResetPasscodeScreen extends ConsumerWidget {
  ResetPasscodeScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      controller: controller,
      subtitle:
          'Enter your phone number to continue, we will send you a verification code.',
      title: 'Reset your Passcode',
      onPressed: () {
        // pushTo(context, PhoneOTPScreen(phoneNumber: controller.text.trim(),));
        ref
            .read(authControllerProvider.notifier)
            .sendSMSOTP(context, controller.text.trim(), true);
      },
    );
  }
}
