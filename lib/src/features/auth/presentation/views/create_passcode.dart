// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../packages.dart';

class CreatePassCodeScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
    final bool isForget;
  const CreatePassCodeScreen({
    required this.phoneNumber,
    required this.isForget,
  });

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
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        bool isEnable = value.text.length == 6;

        return PasscodeWidget(
            onPressed: isEnable
                ? () {
                    ref.read(authControllerProvider.notifier).createPasscode(
                        context, widget.phoneNumber, controller.text, false, widget.isForget);
                    // pushTo(context, CreateProfileScreen());
                  }
                : null,
            subtitle:
                'Create a 6-digit passcode for a fast and easy login to ${AssetConstants.appName}',
            controller: controller,
            btnText: 'Set Passcode',
            title: 'Create a Passcode');
      },
    );
  }
}
