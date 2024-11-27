import 'package:payam_user/packages.dart';

class PinScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  // const PinScreen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      title: 'Transaction PIN',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create a transaction PIN",
                      style: AppTextStyle.headline1,
                    ),
                    Text(
                      "Create a 4-digit pin for making payment",
                      style: AppTextStyle.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
            20.0.spacingH,
            Expanded(
              child: Column(
                children: [
                  PinCodeField(
                    readOnly: true,
                    obscure: true,
                    controller: controller,
                  ),
                  10.0.spacingH,
                  SvgWidget(AssetConstants.lock),
                  20.0.spacingH,
                  NumericKeyboard(
                    rightIcon: Icon(Icons.backspace_outlined),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onKeyboardTap: (value) {
                      if (controller.text.length < 6) {
                        setState(() {
                          controller.text = '${controller.text}$value';
                        });
                      }
                    },
                    rightButtonFn: () {
                      setState(() {
                        if (controller.text != '') {
                          controller.text = controller.text
                              .substring(0, controller.text.length - 1);
                        }
                      });
                    },
                  ),
                  Spacer(),
                  ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, child) {
                      bool isEnable = value.text.length == 6;
                      return LoadingButton(
                          isLoading: ref.watch(authControllerProvider),
                          onPressed: isEnable ? () {} : null,
                          child:
                              Text('Set Pin', style: AppTextStyle.pryBtnStyle));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
