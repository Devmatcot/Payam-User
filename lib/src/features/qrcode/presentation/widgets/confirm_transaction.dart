import '../../../../../packages.dart';

class ConfirmQrCodeTransaction extends ConsumerWidget {
  const ConfirmQrCodeTransaction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20).r,
      height: 500.h,
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
                text: MoneyFormatter(amount: 5000).output.nonSymbol,
              )
            ], style: AppTextStyle.headline1.copyWith(fontSize: 24)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sending to',
              style: AppTextStyle.bodyText4,
            ),
          ),
          5.0.spacingH,
          Container(
            padding: EdgeInsets.all(10).r,
            child: Column(
              children: [
                ConfirmDetails(
                    data: 'Damiloa Grace Adunni', title: 'Account Name'),
                ConfirmDetails(data: '1234567890', title: 'Account Number'),
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
                  data: '50000',
                  title: 'Amount',
                  isAmount: true,
                ),
                ConfirmDetails(data: 'Food bought', title: 'Narration'),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10).r),
          ),
          Spacer(),
          LoadingButton(
              onPressed: () async {
                await pop(context).then((value) => showPinModel(context));
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
