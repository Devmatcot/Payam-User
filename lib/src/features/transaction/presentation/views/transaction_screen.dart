import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/transaction/controller/transaction_controller.dart';
import 'package:payam_user/src/features/transaction/presentation/widgets/transaction_filter_widget.dart';
import 'package:payam_user/src/features/transaction/presentation/widgets/transaction_list.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction History',
                style: AppTextStyle.headline2.copyWith(fontSize: 24),
              ),
              20.0.spacingH,
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                        fill: true,
                        fillColor: AppColors.white,
                        prefixIcons: Padding(
                          padding: EdgeInsets.all(10.0).r,
                          child: SvgWidget(AssetConstants.search),
                        ),
                        hint: 'search for transaction',
                        type: TextInputType.text),
                  ),
                  10.0.spacingW,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => TransactionFilterWidget(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15).r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          color: AppColors.greyBlack.withOpacity(0.15)),
                      child: SvgWidget(AssetConstants.filter),
                    ),
                  )
                ],
              ),
              10.0.spacingH,
              Expanded(
                child: ref.watch(allTransactionHistory).when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      final resevereData = data.reversed.toList();
                      return data.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  30.0.spacingH,
                                  SvgWidget(AssetConstants.noRecord),
                                  Text('No Transaction History',
                                      style: AppTextStyle.bodyText1),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: data.length,
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              // reverse: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2).r,
                                  child: TransactionListWidget(
                                      model: resevereData[index]),
                                );
                              },
                            );
                    },
                    error: (e, s) => Text(e.toString()),
                    loading: () {
                      return ListView.builder(
                        itemCount: 15,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2).r,
                            child: TransactionListShimmer(),
                          );
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class SecondaryButtonWhite extends StatelessWidget {
//   final Function()? onTap;
//   const SecondaryButtonWhite({
//     this.onTap,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//           height: 55.h,
//           // padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12).r,
//               border: Border.all(color: AppColors.primary)),
//           width: double.infinity,
//           child: Center(
//             child: Text(
//               'Cancel Filter',
//               style: AppTextStyle.secBtnStyle,
//             ),
//           )),
//     );
//   }
// }
