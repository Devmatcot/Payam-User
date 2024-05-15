import '../../../../../packages.dart';

class PayamAmountScreen extends ConsumerWidget {
  const PayamAmountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Transfer to Payam',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        children: [
          10.0.spacingH,
          Text(
            'Sending to:',
            style: AppTextStyle.formTextNaturalR,
          ),
          5.0.spacingH,
          BeneListTile(title: 'Regina Adesewa', subTitle: '8100112233'),
          20.0.spacingH,
          AppTextField(
            hint: '10.00 - 100,000.00',
            type: TextInputType.text,
            isAmount: true,
            title: 'Amount',
          ),
          10.0.spacingH,
          AppTextField(
            hint: 'e.g food',
            type: TextInputType.text,
            title: 'Description',
          ),
          20.0.spacingH,
          LoadingButton(
            child: Text(
              'Proceed',
              style: AppTextStyle.pryBtnStyle,
            ),
            onPressed: () {
              bottomSheet(context, ConfirmQrCodeTransaction());
            },
          )
        ],
      ),
      // subTitle: '',
    );
  }
}
