// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../packages.dart';

class ConfirmAirtimeTransaction extends ConsumerWidget {
  const ConfirmAirtimeTransaction({
    required this.biller,
    required this.phoneNumber,
    required this.amount,
    required this.ctx,
  });

  final String amount, phoneNumber, biller;
  final BuildContext ctx;

  // processTransaction(WidgetRef ref, String pin) async {
  //   final process = ref.read(transferConProvider.notifier);
  //   process.wallet2wallet(
  //     context: ctx,
  //     amount: amount,
  //     note: note ?? "",
  //     toUser: phoneNumber,
  //   );
  // }

  // noBioProcess(BuildContext context, WidgetRef ref) async {
  //   await showPinModel(context, () async {
  //     String pin = ref.read(pinProvider);
  //     processTransaction(ref, pin);
  //   }, amount)
  //       .then((value) => pop(context));
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20).r,
      height: 480.h,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(flex: 2),
              Text(
                'Confirm Payment',
                style: AppTextStyle.title.copyWith(fontSize: 16),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: AssetConstants.nairaSymbol,
                  style: AppTextStyle.nairaStyle.copyWith(fontSize: 23)),
              TextSpan(
                text: MoneyFormatter(amount: double.parse(amount))
                    .output
                    .nonSymbol,
              )
            ], style: AppTextStyle.headline1.copyWith(fontSize: 24)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Purchasing for',
              style: AppTextStyle.bodyText4,
            ),
          ),
          5.0.spacingH,
          Container(
            padding: EdgeInsets.all(10).r,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/mtn.png',
                  ),
                  backgroundColor: AppColors.gray,
                ),
                10.0.spacingW,
                Text(
                  phoneNumber,
                  style: AppTextStyle.bodyText1,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10).r),
          ),
          20.0.spacingH,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Payment Detail',
              style: AppTextStyle.bodyText4,
            ),
          ),
          5.0.spacingH,
          Container(
            padding: EdgeInsets.all(10).r,
            child: Column(
              children: [
                ConfirmDetails(
                  data: MoneyFormatter(amount: double.parse(amount))
                      .output
                      .nonSymbol,
                  title: 'Amount',
                  isAmount: true,
                ),
                ConfirmDetails(data: 'free', title: 'Fees'),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10).r),
          ),
          Spacer(),
          LoadingButton(
              onPressed: () async {
                await pop(context)
                    .then((value) => showPinModel(context, () {}, amount));
                // noBioProcess(context, ref);
              },
              child: Text(
                'Proceed',
                style: AppTextStyle.pryBtnStyle,
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: AppColors.scaffoldColorGrey,
          borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))
              .r),
    );
  }
}
