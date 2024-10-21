import '../../../../../packages.dart';
import '../../model/beneficiary_model.dart';

class PayamAmountScreen extends ConsumerWidget {
  final BeneficiaryModel model;
  PayamAmountScreen({super.key, required this.model});
  TextEditingController _amountCon = TextEditingController();
  TextEditingController _descriptionCon = TextEditingController();
  String newAmount = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingOverlayer(
      isLoading: ref.watch(transferConProvider),
      child: OverlayWidget(
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
            BeneListTile(data: model),
            20.0.spacingH,
            AppTextField(
              hint: '10.00 - 100,000.00',
              isAmount: true,
              title: 'Amount',
              type: TextInputType.numberWithOptions(decimal: true),
              formeter: [
                DecimalFormatter(),
              ],
              onChange: (value) {
                newAmount = value.replaceAll(RegExp(r','), '');
              },
              validator: (p0) {
                if (_amountCon.text.isEmpty) {
                  return 'Provide specific amount';
                }
                return null;
              },
            ),
            10.0.spacingH,
            AppTextField(
              hint: 'e.g food',
              type: TextInputType.text,
              title: 'Description',
              controller: _descriptionCon,
            ),
            20.0.spacingH,
            LoadingButton(
              child: Text(
                'Proceed',
                style: AppTextStyle.pryBtnStyle,
              ),
              onPressed: () {
                bottomSheet(
                    context,
                    ConfirmQrCodeTransaction(
                      acctName: '${model.accountName}',
                      acctNo: model.accountNumber.substring(3),
                      // acctNo: '7064610605',
                      amount: newAmount,
                      ctx: context,
                      note: _descriptionCon.text,
                    ));
              },
            )
          ],
        ),
        // subTitle: '',
      ),
    );
  }
}
