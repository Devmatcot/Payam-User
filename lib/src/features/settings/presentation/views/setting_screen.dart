import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/settings/presentation/views/kyc_screen.dart';
import 'package:payam_user/src/features/settings/presentation/views/notification.dart';
import 'package:payam_user/src/features/settings/presentation/views/profile_details.dart';
import 'package:payam_user/src/features/settings/presentation/views/security.dart';

import '../../model/setting_modal.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider);

    final List<SettingsModel> proSettingList = [
      SettingsModel(
          icon: AssetConstants.account,
          title: 'My Account',
          subtitle: 'Edit and manage your account',
          page: ProfileDetailsScreen()),
      SettingsModel(
          icon: AssetConstants.card,
          title: 'Payment Methods',
          subtitle: 'Update your payment methods'
          // page: TransactionHistory()
          ),
      SettingsModel(
          icon: AssetConstants.noti,
          title: 'Notification',
          page: NotificationScreen(),
          subtitle: 'Control how you receive notifications'),
      SettingsModel(
          icon: AssetConstants.shield,
          title: 'Security',
          page: SecurityScreen(),
          subtitle: 'Secure your account '),
      SettingsModel(
          icon: AssetConstants.setting,
          title: 'KYC Verification',
          page: KYCVerificationScreen(),
          subtitle: 'Verify your account now'),
      SettingsModel(
          icon: AssetConstants.help,
          title: 'Help & Support',
          subtitle: 'Need assistance? We’re here to help'),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0).r,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${userModel?.firstName}',
              style: AppTextStyle.headline2.copyWith(fontSize: 24),
            ),
            20.0.spacingH,
            Container(
              padding: EdgeInsets.all(24).r,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.gray,
                    radius: 25,
                  ),
                  5.0.spacingH,
                  Text(
                    '${userModel?.firstName} ${userModel?.lastName}',
                    style: AppTextStyle.subtitle1,
                  ),
                  Text(
                    '+${userModel?.phoneNumber}',
                    style: AppTextStyle.bodyText2,
                  ),
                  20.0.spacingH,
                  Text(
                    'Your wallet balance',
                    style: AppTextStyle.formTextS,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: AssetConstants.nairaSymbol,
                        style: TextStyle(fontFamily: 'Ariel')),
                    TextSpan(
                        text: MoneyFormatter(
                                amount: double.parse(userModel?.balance ?? "0"))
                            .output
                            .nonSymbol)
                  ], style: AppTextStyle.bodyText1.copyWith(fontSize: 20)))
                ],
              ),
            ),
            20.0.spacingH,
            ...List.generate(proSettingList.length, (index) {
              final settings = proSettingList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0).r,
                child: SettingListWidget(settings: settings),
              );
            }),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Logout',
                    style: AppTextStyle.subtitle1
                        .copyWith(color: AppColors.redLight),
                  ),
                  Icon(
                    Icons.logout_rounded,
                    color: AppColors.redLight,
                  )
                ],
              ),
            ),
            50.0.spacingH
          ],
        ),
      ),
    );
  }
}

class SettingListWidget extends StatelessWidget {
  const SettingListWidget({
    super.key,
    required this.settings,
  });

  final SettingsModel settings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (settings.page != null) {
          pushTo(context, settings.page!);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24).r,
        child: Row(
          children: [
            SvgWidget(
              settings.icon,
            ),
            10.0.spacingW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settings.title, // 'My Account',
                  style: AppTextStyle.subtitle1,
                ),
                Text(
                  settings.subtitle ?? '', // 'Edit and manage your account',
                  style: AppTextStyle.formTextS,
                )
              ],
            ),
            Spacer(),
            settings.leading != null
                ? settings.leading!
                : SvgWidget(AssetConstants.arrowforward)
          ],
        ),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20).r),
      ),
    );
  }
}
