import '../../../../../packages.dart';
import 'phone_field.dart';

class AuthPhoneWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final TextEditingController controller;
  const AuthPhoneWidget({
    required this.onPressed,
    required this.subtitle,
    required this.title,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBody(
      title: title,
      subTitle: subtitle,
      child: Expanded(
        child: Column(
          children: [
            AppPhoneField(
              controller: controller,
            ),
            Spacer(),
            LoadingButton(
              isLoading: ref.watch(authControllerProvider),
                onPressed: onPressed,
                child: Text('Proceed', style: AppTextStyle.pryBtnStyle))
          ],
        ),
      ),
    );
  }
}
