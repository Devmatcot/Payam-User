import 'package:payam_user/src/features/utility/presentation/views/airtime_screen.dart';
import 'package:payam_user/src/features/utility/presentation/views/data_screen.dart';
import 'package:payam_user/src/features/utility/presentation/views/electricity_screen.dart';

import '../../../../../packages.dart';

class UtilityScreen extends ConsumerWidget {
  const UtilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: '',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.0.spacingH,
            Text('Pay Bills',
                style: AppTextStyle.headline2.copyWith(fontSize: 24)),
            10.0.spacingH,
            CustomListTile(
                conColor: Color(0xFFACE9D0),
                icons: AssetConstants.call,
                page: AirtimeScreen(),
                title: 'Airtime',
                subTitle: 'Recharge your airtime with few clicks'),
            10.0.spacingH,
            CustomListTile(
              icons: AssetConstants.internet,
              conColor: Color(0xFFD1C0FF),
              page: DataScreen(),
              title: 'Internet Data',
              subTitle: 'Renew your internet subscription',
            ),
            10.0.spacingH,
            CustomListTile(
              icons: AssetConstants.electricity,
              conColor: Color(0xFFB0CDFD),
              page: ElectricityScreen(),
              title: 'Electricity',
              subTitle: 'Buy electricity token and always stay on',
            ),
            10.0.spacingH,
            CustomListTile(
              icons: AssetConstants.cabletv,
              conColor: Color(0xFFFFF1C4),
              // page: BankTransferScreen(),
              title: 'Cable TV',
              subTitle: 'Renew you cable plan and enjoy your shows',
            ),
          ],
        ),
      ),
      // subTitle: '',
    );
  }
}
