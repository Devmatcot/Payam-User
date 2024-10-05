import 'package:payam_user/src/features/transfer/presentation/views/bank_transfer.dart';

import '../../../../../packages.dart';

class RideScreen extends ConsumerWidget {
  const RideScreen({super.key});

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
            Text('PayamRide',
                style: AppTextStyle.headline2.copyWith(fontSize: 24)),
            10.0.spacingH,
            RideListTile(
              icons: AssetConstants.orderRide,
              page: PayamTransferScreen(),
              title: 'Order for Ride',
            ),
            10.0.spacingH,
            RideListTile(
              icons: AssetConstants.sendPackage,
              page: BankTransferScreen(),
              title: 'Send package',
            ),
          ],
        ),
      ),
      // subTitle: '',
    );
  }
}
