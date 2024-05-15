
import '../../../../../packages.dart';

class PayamTransferScreen extends ConsumerWidget {
  const PayamTransferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Transfer to Payam',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        children: [
          AppTextField(
            hint: 'Phone No/Payam Tag/Email',
            type: TextInputType.text,
            title: 'Enter customer info',
          ),
          20.0.spacingH,
          Text(
            'Recent Beneficiaries',
            style: AppTextStyle.formTextNaturalR,
          ),
          10.0.spacingH,
          ...List.generate(
              10,
              (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5.0).r,
                  child: BeneListTile(
                    page: PayamAmountScreen(),
                      title: 'Regina Adesewa', subTitle: '8100112233'))),
          10.0.spacingH,
        ],
      ),
      // subTitle: '',
    );
  }
}
