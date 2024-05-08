import 'package:payam_user/src/features/auth/presentation/widgets/passcode_widget.dart';
import 'package:payam_user/src/features/home/presentation/views/control_screen.dart';

import '../../../../../packages.dart';

class LoginPassCodeScreen extends ConsumerStatefulWidget {
  const LoginPassCodeScreen({super.key});

  @override
  ConsumerState<LoginPassCodeScreen> createState() =>
      _LoginPassCodeScreenState();
}

class _LoginPassCodeScreenState extends ConsumerState<LoginPassCodeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return PasscodeWidget(
        isForgetPass: true,
        onPressed: () {
          // pushTo(context, CreateProfileScreen());
          pushToAndClearStack(context, ControlScreen());
        },
        subtitle:
            'Enter your 6-digit passcode to login into your ${AssetConstants.appName} account',
        controller: controller,
        btnText: 'Login',
        title: 'Enter your Passcode');
  }
}
