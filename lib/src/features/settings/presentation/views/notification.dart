import 'package:payam_user/packages.dart';
import 'package:payam_user/src/core/shared/custom_switch.dart';
import 'package:payam_user/src/features/settings/model/setting_modal.dart';
import 'package:payam_user/src/features/settings/presentation/views/setting_screen.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Notifications',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          children: [
            20.0.spacingH,
            SettingListWidget(
              settings: SettingsModel(
                  icon: AssetConstants.email,
                  title: 'SMS Notification',
                  leading: CustomSwitch(onSwitch: (onSwitch) {}),
                  subtitle: 'Receive SMS Notification'),
            ),
            10.0.spacingH,
            SettingListWidget(
              settings: SettingsModel(
                  icon: AssetConstants.promo,
                  title: 'Promo and Deals',
                  leading: CustomSwitch(onSwitch: (onSwitch) {}),
                  subtitle: 'Receive update for promo and deals'),
            ),
          ],
        ),
      ),
    );
  }
}
