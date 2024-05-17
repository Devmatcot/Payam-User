import '../../../../../packages.dart';

class LoginPassCodeScreen extends ConsumerStatefulWidget {
  final String phoneNum;
  const LoginPassCodeScreen({
    required this.phoneNum,
  });

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
          //pushToAndClearStack(context, ControlScreen());
          ref
              .read(authControllerProvider.notifier)
              .loginPassCode(context, widget.phoneNum, controller.text.trim());
        },
        subtitle:
            'Enter your 6-digit passcode to login into your ${AssetConstants.appName} account',
        controller: controller,
        btnText: 'Login',
        title: 'Enter your Passcode');
  }
}
