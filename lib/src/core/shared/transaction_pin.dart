import '../../../packages.dart';

class TransactionPinModal extends ConsumerStatefulWidget {
  const TransactionPinModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionPinModalState();
}

class _TransactionPinModalState extends ConsumerState<TransactionPinModal> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20).copyWith(top: 50).r,
        color: AppColors.white,
        child: Column(
          children: [
            backButtonLong(context),
            10.0.spacingH,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'You about to send '),
                  TextSpan(
                      text: AssetConstants.nairaSymbol,
                      style: AppTextStyle.nairaStyle),
                  TextSpan(text: MoneyFormatter(amount: 5000).output.nonSymbol)
                ],
              ),
              style: AppTextStyle.headline2,
            ),
            Text('Enter your PIN to Continue',
                style: AppTextStyle.formTextNatural.copyWith(fontSize: 12)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).r,
              child: PinCodeField(
                readOnly: true,
                length: 4,
                obscure: true,
                controller: controller,
                onChanged: (value) async {
                  if (value.length == 4) {
                    await pop(context).then((value) => showTranSuccessModel(
                        context,
                        'Payment Successful',
                        'You have successful sent 5000.00 to Ademola Chukwdi'));
                  }
                },
              ),
            ),
            Spacer(),
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
          ],
        ),
      )),
    );
  }
}
