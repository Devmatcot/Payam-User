import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/auth/presentation/views/login_screen.dart';

class SuccessRegistration extends ConsumerWidget {
  const SuccessRegistration({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30).r,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgWidget(AssetConstants.success),
            Text(
              'Success',
              style: AppTextStyle.headline1.copyWith(color: AppColors.primary),
            ),
            // 10.0.spacingH,
            Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: Text(
                'Registration Completed successfully, process to login',
                style: AppTextStyle.formTextNaturalR,
                textAlign: TextAlign.center,
              ),
            ),
            // 10.0.spacingH,
            LoadingButton(
              child: Text(
                'Get Started',
                style: AppTextStyle.pryBtnStyle,
              ),
              onPressed: () {
                pushReplacementTo(context, LoginScreen());
              },
            )
          ]),
        ),
      ),
    );
  }
}
