import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/fundwallet/controller/fund_controller.dart';

class FundWallet extends ConsumerWidget {
  FundWallet({super.key});
  String newAmount = '';
  TextEditingController amountCon = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usermodel = ref.watch(userModelProvider);

    return OverlayWidget(
      bgColor: AppColors.white,
      title: 'Fund Wallet',
      child: Padding(
        padding: const EdgeInsets.all(24.0).r,
        child: Column(
          children: [
            Text(
              'How much do you want to add?',
              style: AppTextStyle.headline2,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0).r,
                child: TextField(
                  // textAlign: TextAlign.center,
                  controller: amountCon,
                  onChanged: (value) {
                    newAmount = value.replaceAll(RegExp(r','), '');
                    print(newAmount);
                  },
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: AppTextStyle.headline1.copyWith(fontSize: 34.sp),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyTextInputFormatter.currency(symbol: '')
                  ],
                  decoration: InputDecoration(
                      hintText: 'Enter Amount',
                      hintStyle:
                          AppTextStyle.formText.copyWith(fontSize: 34.sp),
                      prefix: NairaText(color: AppColors.black),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Wallet Balance: ',
                  style: AppTextStyle.bodyText4
                      .copyWith(fontWeight: AppFontWeight.light),
                ),
                NairaText(
                  fontSize: 16,
                ),
                Text(
                  MoneyFormatter(
                          amount: double.parse(usermodel?.balance ?? '0'))
                      .output
                      .nonSymbol,
                  style: AppTextStyle.bodyText5,
                ),
              ],
            ),
            40.0.spacingH,
            ValueListenableBuilder(
              valueListenable: amountCon,
              builder: (context, value, child) {
                return LoadingButton(
                    isLoading: ref.watch(fundController),
                    onPressed: value.text.isNotEmpty
                        ? () {
                            showPinModel(context, () {
                              String pin = ref.read(pinProvider);
                              ref
                                  .read(fundController.notifier)
                                  .intiateFunding(context, pin, newAmount);
                            }, amountCon.text);
                          }
                        : null,
                    child: Text('Proceed', style: AppTextStyle.pryBtnStyle));
              },
            )
          ],
        ),
      ),
    );
  }
}
