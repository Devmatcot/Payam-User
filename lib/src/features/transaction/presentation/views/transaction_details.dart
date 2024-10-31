import 'package:intl/intl.dart';
import 'package:payam_user/packages.dart';

import '../../model/transaction_model.dart';

class TransactionDetailsScreen extends ConsumerWidget {
  final TransactionHistoryModel model;
  const TransactionDetailsScreen({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                color: AppColors.border,
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
              )),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).r,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              pop(context);
                            },
                            child: SvgWidget(AssetConstants.arrowleft)),
                        Text(
                          'Transaction Details',
                          style: AppTextStyle.headline1,
                        ),
                        SizedBox()
                      ],
                    ),
                    20.0.spacingH,
                    Container(
                      padding: EdgeInsets.all(20).r,
                      width: double.infinity,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20.h,
                            backgroundColor: AppColors.purple,
                            child: SvgWidget(
                              AssetConstants.send,
                              color: AppColors.white,
                            ),
                          ),
                          10.0.spacingH,
                          Container(
                            padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5)
                                .r,
                            decoration: BoxDecoration(
                                color: AppColors.border.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30).r),
                            child: Text(
                              '- ₦' +
                                  MoneyFormatter(
                                          amount: double.parse(model.amount))
                                      .output
                                      .nonSymbol,
                              style: AppTextStyle.bodyText1.copyWith(
                                  fontWeight: AppFontWeight.semiBold,
                                  color: AppColors.primaryDeep,
                                  fontSize: 32),
                            ),
                          ),
                          10.0.spacingH,
                          Text(
                            DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                            style: AppTextStyle.bodyText1,
                          ),
                          Text(
                            'Transfer to ${model.receiver.name}',
                            style: AppTextStyle.bodyText4,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20).r),
                    ),
                    20.0.spacingH,
                    Container(
                        padding: EdgeInsets.all(20).r,
                        child: Column(
                          children: [
                            ConfirmDetails(
                                data: model.status.toCapitalized(),
                                title: 'Status',
                                color: AppColors.primary),
                            ConfirmDetails(
                                data: model.type
                                    .replaceAll('_', ' ')
                                    .toCapitalized(), //'Bank Transfer',
                                title: 'Transaction Type'),
                            ConfirmDetails(
                                data: model.receiver.name, //'Matthew Olayemi',

                                title: 'Account Name'),
                            ConfirmDetails(
                                data: model.receiver.id
                                    .toString(), //'1232800325',

                                title: 'Account Number'),
                            ConfirmDetails(data: 'Payam Bank', title: 'Bank'),
                            ConfirmDetails(
                                data: model.reference, //'2323232SDS3323SD23',

                                title: 'Reference'),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20).r)),
                    20.0.spacingH,
                    Container(
                        padding: EdgeInsets.all(20).r,
                        child: Column(
                          children: [
                            ConfirmDetails(
                              data: model.amount, //'10,000',
                              title: 'Amount',
                              isAmount: true,
                            ),
                            ConfirmDetails(
                              data: '0',
                              title: 'Fees',
                              isAmount: true,
                            ),
                            ConfirmDetails(
                              data: model.amount, //'10,010',
                              title: 'Total',
                              isAmount: true,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20).r)),
                    20.0.spacingH,
                    Row(
                      children: [
                        Expanded(
                            child: LoadingButton(
                                onPressed: () {},
                                child: Text(
                                  'Share Receipt',
                                  style: AppTextStyle.pryBtnStyle,
                                ))),
                        10.0.spacingW,
                        Expanded(
                          child: SecondaryButtonWhite(
                            title: 'Report Transaction',
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                    30.0.spacingH
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
