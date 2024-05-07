import 'package:payam_user/src/features/auth/presentation/views/login_passcode.dart';

import '../../../../../packages.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPhoneWidget(
      onPressed: () {
        pushTo(context, LoginPassCodeScreen());
      },
      subtitle: 'Enter your phone number to login into your account.',
      title: 'Welcome to Payam',
    );
  }
}
