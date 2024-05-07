import 'package:payam_user/src/features/auth/presentation/widgets/passcode_widget.dart';

import '../../../../../packages.dart';

class CreatePassCodeScreen extends ConsumerStatefulWidget {
  const CreatePassCodeScreen({super.key});

  @override
  ConsumerState<CreatePassCodeScreen> createState() =>
      _CreatePassCodeScreenState();
}

class _CreatePassCodeScreenState extends ConsumerState<CreatePassCodeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return PasscodeWidget(
        onPressed: () {
          pushTo(context, CreateProfileScreen());
        },
        subtitle:
            'Create a 6-digit passcode for a fast and easy login to ${AssetConstants.appName}',
        controller: controller,
        btnText: 'Set Passcode',
        title: 'Create a Passcode');
  }
}
