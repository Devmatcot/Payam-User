import 'package:intl/intl.dart';
import 'package:payam_user/src/features/home/model/service_model.dart';
import 'package:payam_user/src/features/qrcode/presentation/views/qrcode_screen.dart';

import '../../../../../packages.dart';
import '../../../transfer/presentation/views/transfer_screen.dart';

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
    ServiceModel(title: 'Pay bill', icon: AssetConstants.bill),
    ServiceModel(title: 'Payride', icon: AssetConstants.ride),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20).r,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(AssetConstants.avater),
                    backgroundColor: AppColors.black25,
                  ),
                  10.0.spacingW,
                  Text(
                    'Welcome! Matcot',
                    style: AppTextStyle.formTextNatural
                        .copyWith(fontWeight: AppFontWeight.regular),
                  )
                ],
              ),
              SvgWidget(AssetConstants.notification)
            ],
          ),
          20.0.spacingH,

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
                                  text: MoneyFormatter(amount: 50000)
                                      .output
                                      .nonSymbol)
                            ],
                            style:
                                AppTextStyle.bodyText1.copyWith(fontSize: 20))),
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            'Recent Transactions',
            style: AppTextStyle.formTextNaturalR,
          ),
          10.0.spacingH,
          ...List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2).r,
              child: TransactionList(),
            ),
          ),
          20.0.spacingH,
        ],
      )),
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

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  TextSpan(text: MoneyFormatter(amount: 3000).output.nonSymbol)
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
    );
  }
}
