import '../../../../../packages.dart';
import '../../model/setting_modal.dart';

class SettingWidgets extends ConsumerWidget {
  final SettingsModel settings;
  const SettingWidgets({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // LocationService().getLocation();
        if (settings.page != null) {
          pushTo(context, settings.page!);
        } else if (settings.title.contains('Log')) {
          // ref.read(authControllerProvider.notifier).logOut(context);
        } else if (settings.onTap != null) {
          settings.onTap!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10).r,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.h,
              backgroundColor: AppColors.blueLight,
              child: SvgWidget(
                settings.icon,
                color: AppColors.primary,
                height: 25.h,
              ),
            ),
            10.0.spacingW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settings.title,
                  style: AppTextStyle.caption
                      .copyWith(fontWeight: AppFontWeight.semiBold),
                ),
              ],
            ),
            Spacer(),
            if (settings.arrow) SvgWidget(AssetConstants.arrow_right),
            if (settings.leading != null) settings.leading!
          ],
        ),
      ),
    );
  }
}

class SecurityWidgets extends StatelessWidget {
  final SettingsModel settings;
  const SecurityWidgets({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (settings.page != null) {
          pushTo(context, settings.page!);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            color: Color(0xFFDADADA),
          ),
        ),
        child: Row(
          children: [
            SvgWidget(
              settings.icon,
              color: AppColors.black,
            ),
            10.0.spacingW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settings.title,
                  style: AppTextStyle.bodyText1,
                ),
                Text(
                  settings.subtitle!,
                  style: AppTextStyle.formText.copyWith(fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.appDark,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
