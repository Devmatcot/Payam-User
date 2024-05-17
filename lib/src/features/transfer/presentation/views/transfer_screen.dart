import 'package:payam_user/src/features/transfer/presentation/views/bank_transfer.dart';

import '../../../../../packages.dart';

class TransferScreen extends ConsumerWidget {
  const TransferScreen({super.key});

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
            Text('Transfer',
                style: AppTextStyle.headline2.copyWith(fontSize: 24)),
            10.0.spacingH,
            CustomListTile(
                conColor: AppColors.primary,
                icons: AssetConstants.smalllogo,
                page: PayamTransferScreen(),
                title: 'Transfer to ${AssetConstants.appName}',
                subTitle:
                    'Send money from ${AssetConstants.appName} to ${AssetConstants.appName}'),
            10.0.spacingH,
            CustomListTile(
              icons: AssetConstants.banklogo,
              conColor: AppColors.appBlue,
              page: BankTransferScreen(),
              title: 'Transfer to Other Banks',
              subTitle:
                  'Send money from ${AssetConstants.appName} to other banks',
            ),
          ],
        ),
      ),
      // subTitle: '',
    );
  }
}
