import 'package:payam_user/src/features/home/model/service_model.dart';
import 'package:payam_user/src/features/qrcode/presentation/views/qrcode_screen.dart';
import 'package:payam_user/src/features/transaction/controller/transaction_controller.dart';

import '../../../../../packages.dart';
import '../../../transaction/presentation/widgets/transaction_list.dart';
import '../../../transfer/presentation/views/transfer_screen.dart';
import '../../../utility/presentation/views/utility_sreen.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<DashBoardScreen> {
  List<ServiceModel> serviceList = [
    ServiceModel(
        title: 'Transfer',
        icon: AssetConstants.transfer,
        page: TransferScreen()),
    ServiceModel(
        title: 'Pay bill', icon: AssetConstants.bill, page: UtilityScreen()),
    ServiceModel(title: 'Payride', icon: AssetConstants.ride),
  ];
  @override
  Widget build(BuildContext context) {
    final usermodel = ref.watch(userModelProvider);
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await ref
              .read(authControllerProvider.notifier)
              .currentUser(context, '${usermodel.phoneNumber.substring(3)}');
          ref.refresh(allTransactionHistory);
        },
        child: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(20).r,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Image.network(AssetConstants.avaterUrl),
                    // Image.network(
                    //   'https://ui-avatars.com/api/?name=John+Doe',
                    //   errorBuilder: (BuildContext context, Object exception,
                    //       StackTrace? stackTrace) {
                    //     return Text('Failed to load avatar');
                    //   },
                    // ),
                    CircleAvatar(
                      radius: 18,
                      // backgroundImage: AssetImage(AssetConstants.avater),
                      child: usermodel!.profilePhotoUrl.contains('ui-avatars')
                          ? Text(
                              '${usermodel.firstName.split('').first}${usermodel.lastName.split('').first}')
                          : null,
                      backgroundImage:
                          !usermodel.profilePhotoUrl.contains('ui-avatars')
                              ? NetworkImage(usermodel.profilePhotoUrl)
                              : null,
                      backgroundColor: AppColors.black54,
                    ),
                    10.0.spacingW,
                    Text(
                      'Welcome ${usermodel.firstName}!',
                      style: AppTextStyle.formTextNatural
                          .copyWith(fontWeight: AppFontWeight.regular),
                    )
                  ],
                ),
                SvgWidget(AssetConstants.notification)
              ],
            ),
            10.0.spacingH,

            // Balance Card
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: AppTextStyle.bodyText4,
                        ),
                        FittedBox(
                          child: Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                    text: AssetConstants.nairaSymbol,
                                    style: TextStyle(fontFamily: 'Ariel')),
                                TextSpan(
                                    text: MoneyFormatter(
                                            amount: double.parse(
                                                usermodel.balance ?? "0"))
                                        .output
                                        .nonSymbol)
                              ],
                              style: AppTextStyle.bodyText1
                                  .copyWith(fontSize: 20))),
                        )
                      ],
                    ),
                  ),
                  10.0.spacingW,
                  Container(
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).r,
                        border: Border.all(color: AppColors.black25)),
                    child: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.natural),
                        Text(
                          'Fund Wallet',
                          style: AppTextStyle.formTextNatural
                              .copyWith(fontWeight: AppFontWeight.regular),
                        )
                      ],
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45).r,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10).r),
            )
            // Action Button
            ,
            20.0.spacingH,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pushTo(context, QrCodeScreen());
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgWidget(AssetConstants.qrcode),
                          5.0.spacingW,
                          FittedBox(
                            child: Text(
                              'Scan to pay',
                              style: AppTextStyle.bodyText1
                                  .copyWith(color: AppColors.primary),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(30).r),
                    ),
                  ),
                ),
                15.0.spacingW,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            'Receive money',
                            style: AppTextStyle.pryBtnStyle,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        // border: Border.all(color: AppColors.primary),
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30).r),
                  ),
                ),
              ],
            )
            // Service
            ,
            20.0.spacingH,

            Text(
              'Services',
              style: AppTextStyle.formTextNaturalR,
            ),
            10.0.spacingH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(serviceList.length,
                  (index) => ServiceBox(serviceList: serviceList[index])),
            ),
            20.0.spacingH,

            Text(
              'Recent Transactions (5)',
              style: AppTextStyle.formTextNaturalR,
            ),
            10.0.spacingH,
            ref.watch(allTransactionHistory).when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length <= 5 ? data.length : 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2).r,
                        child: TransactionListWidget(model: data[index]),
                      );
                    },
                  );
                },
                error: (e, s) => Text(e.toString()),
                loading: () {
                  return ListView.builder(
                    itemCount: 5,
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
            20.0.spacingH,
          ],
        )),
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  const ServiceBox({
    super.key,
    required this.serviceList,
  });

  final ServiceModel serviceList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (serviceList.page != null) {
          pushTo(context, serviceList.page!);
        }
      },
      child: Container(
        padding: EdgeInsets.all(30).r,
        child: Column(
          children: [SvgWidget(serviceList.icon), Text(serviceList.title)],
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
    );
  }
}
