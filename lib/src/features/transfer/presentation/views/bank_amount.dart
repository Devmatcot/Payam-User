import 'package:payam_user/src/features/transfer/model/bank_validate.dart';
import 'package:payam_user/src/features/transfer/presentation/widgets/confirm_bank.dart';

import '../../../../../packages.dart';

class BankAmountScreen extends ConsumerWidget {
  final BankValidate model;
  BankAmountScreen({super.key, required this.model});
  TextEditingController _amountCon = TextEditingController();
  TextEditingController _descriptionCon = TextEditingController();
  String newAmount = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingOverlayer(
      isLoading: ref.watch(transferConProvider),
      child: OverlayWidget(
        title: 'Transfer to Bank',
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          children: [
            10.0.spacingH,
            Text(
              'Sending to:',
              style: AppTextStyle.formTextNaturalR,
            ),
            5.0.spacingH,
            CustomListTile(
                title: model.accountName,
                icons: 'bank_logo',
                subTitle: '${model.accountNumber} - ${model.bankName}'),
            20.0.spacingH,
            AppTextField(
              hint: '100.00 - 100,000.00',
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
                    ConfirmBankTransaction(
                      acctName: '${model.accountName}',
                      acctNo: model.accountNumber,
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
