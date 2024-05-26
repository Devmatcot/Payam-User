import '../../../../../packages.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      controller: controller,
      onPressed: () {
        // pushTo(context, LoginPassCodeScreen(phoneNum: controller.text.trim(),));
        ref
            .read(authControllerProvider.notifier)
            .loginUser(context, controller.text.trim());
      },
      subtitle: 'Enter your phone number to login into your account.',
      title: 'Welcome to ${AssetConstants.appName}',
    );
  }
}
