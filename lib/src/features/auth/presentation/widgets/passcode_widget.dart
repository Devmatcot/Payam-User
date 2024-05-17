import 'package:payam_user/src/features/auth/presentation/views/reset_passcode.dart';

import '../../../../../packages.dart';

class PasscodeWidget extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;
  final String btnText;
  final bool isForgetPass;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  const PasscodeWidget({
    required this.onPressed,
    required this.subtitle,
    required this.btnText,
    required this.controller,
    required this.title,
    this.isForgetPass = false,
    super.key,
  });

  @override
  ConsumerState<PasscodeWidget> createState() => _PasscodeWidgetState();
}

class _PasscodeWidgetState extends ConsumerState<PasscodeWidget> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      title: widget.title,
      subTitle: widget.subtitle,
      subWidget: widget.isForgetPass
          ? InkWell(
              onTap: () {
                pushTo(context, ResetPasscodeScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10)
                    .r
                    .copyWith(bottom: 20)
                    .r,
                child: Text(
                  'Forgot Passcode?',
                  style:
                      AppTextStyle.bodyText1.copyWith(color: AppColors.primary),
                ),
              ))
          : null,
      child: Expanded(
        child: Column(
          children: [
            PinCodeField(
              readOnly: true,
              obscure: true,
              controller: widget.controller,
            ),
            10.0.spacingH,
            SvgWidget(AssetConstants.lock),
            20.0.spacingH,
            NumericKeyboard(
              rightIcon: Icon(Icons.backspace_outlined),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onKeyboardTap: (value) {
                if (widget.controller.text.length < 6) {
                  setState(() {
                    widget.controller.text = '${widget.controller.text}$value';
                  });
                }
              },
              rightButtonFn: () {
                setState(() {
                  if (widget.controller.text != '') {
                    widget.controller.text = widget.controller.text
                        .substring(0, widget.controller.text.length - 1);
                  }
                });
              },
            ),
            Spacer(),
            LoadingButton(
                isLoading: ref.watch(authControllerProvider),
                onPressed: widget.onPressed,
                child: Text(widget.btnText, style: AppTextStyle.pryBtnStyle))
          ],
        ),
      ),
    );
  }
}
