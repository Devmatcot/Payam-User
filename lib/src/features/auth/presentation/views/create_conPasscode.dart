// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../packages.dart';

class ConfirmPassCodeScreen extends ConsumerStatefulWidget {
  final String phoneNumber;

  const ConfirmPassCodeScreen({
    required this.phoneNumber,
  });

  @override
  ConsumerState<ConfirmPassCodeScreen> createState() =>
      _CreatePassCodeScreenState();
}

class _CreatePassCodeScreenState extends ConsumerState<ConfirmPassCodeScreen> {
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
                        context, widget.phoneNumber, controller.text, true, false);
                    // pushTo(context, CreateProfileScreen());
                  }
                : null,
            subtitle:
                'Confirm your 6-digit passcode for a fast and easy login to ${AssetConstants.appName}',
            controller: controller,
            btnText: 'Confirm Passcode',
            title: 'Re-enter Passcode');
      },
    );
  }
}
