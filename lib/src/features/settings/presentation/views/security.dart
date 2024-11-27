import 'package:payam_user/packages.dart';
import 'package:payam_user/src/core/shared/custom_switch.dart';
import 'package:payam_user/src/features/settings/model/setting_modal.dart';
import 'package:payam_user/src/features/settings/presentation/views/change_pin_otp.dart';
import 'package:payam_user/src/features/settings/presentation/views/setting_screen.dart';

class SecurityScreen extends ConsumerWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Security',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          children: [
            20.0.spacingH,
            SettingListWidget(
              settings: SettingsModel(
                  icon: AssetConstants.fingerprint,
                  title: 'Enable Biometric',
                  leading: CustomSwitch(onSwitch: (onSwitch) {}),
                  subtitle: 'Login to your account with biometric'),
            ),
            10.0.spacingH,
            SettingListWidget(
              settings: SettingsModel(
                  icon: AssetConstants.lock_open,
                  title: 'Change Login Passcode',
                  subtitle: 'Change your login passcode'),
            ),
            10.0.spacingH,
            SettingListWidget(
              settings: SettingsModel(
                  icon: AssetConstants.pin,
                  page: ChangeTransactionPinScreen(),
                  title: 'Change Transaction PIN',
                  subtitle: 'Change your transaction PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
