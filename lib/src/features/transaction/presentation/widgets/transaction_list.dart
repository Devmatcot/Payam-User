import 'package:intl/intl.dart';
import 'package:payam_user/src/features/transaction/model/transaction_model.dart';
import 'package:payam_user/src/features/transaction/presentation/views/transaction_details.dart';

import '../../../../../packages.dart';

class TransactionListWidget extends StatelessWidget {
  final TransactionHistoryModel model;
  const TransactionListWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool walletTransafer = model.type.contains('_to_');
    return GestureDetector(
      onTap: () {
        pushTo(context, TransactionDetailsScreen(model: model));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.h,
              backgroundColor: AppColors.purple,
              child: SvgWidget(
                AssetConstants.send,
                height: 18.h,
                color: AppColors.white,
              ),
            ),
            10.0.spacingW,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                            // isCredit
                            // ?
                            // 'Wallet Transfer - ${model.receiver?.name} ${model.type}',
                            '${model.type.replaceAll('_', ' ').toTitleCase()} ${walletTransafer ? '- ${model.receiver?.name}' : ''}',
                            // : model.narration ?? 'Wallet Funding',
                            style: AppTextStyle.formTextNaturalR),
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: AssetConstants.nairaSymbol,
                              style: TextStyle(fontFamily: 'Ariel')),
                          TextSpan(
                              text: MoneyFormatter(
                                      amount: double.parse(model.amount))
                                  .output
                                  .nonSymbol)
                        ]),
                        style: AppTextStyle.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // '${model.receiver.name}',
                        DateFormat.yMMMd().add_jm().format(model.createdAt),
                        style: AppTextStyle.formText.copyWith(fontSize: 12),
                      ),
                      Text(
                        model.status.toCapitalized(),
                        style: AppTextStyle.formText.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionListShimmer extends StatelessWidget {
  const TransactionListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerOverlay(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.h,
              backgroundColor: AppColors.gray,
              child: SvgWidget(
                AssetConstants.send,
                height: 18.h,
              ),
            ),
            10.0.spacingW,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Money Out', style: AppTextStyle.formTextNatural),
                  Text(
                    'Wallet transfer To - Dev Matcot',
                    style: AppTextStyle.formText.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: AssetConstants.nairaSymbol,
                        style: TextStyle(fontFamily: 'Ariel')),
                    TextSpan(
                        text: MoneyFormatter(amount: 3000).output.nonSymbol)
                  ]),
                  style: AppTextStyle.bodyText1,
                ),
                Text(
                  DateFormat.yMMMd().add_jm().format(DateTime.now()),
                  style: AppTextStyle.formText.copyWith(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
