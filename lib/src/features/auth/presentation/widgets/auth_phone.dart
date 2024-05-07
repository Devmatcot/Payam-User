
import '../../../../../packages.dart';
import 'phone_field.dart';

class AuthPhoneWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  const AuthPhoneWidget({
    required this.onPressed,
    required this.subtitle,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      title: title,
      subTitle: subtitle,
      child: Expanded(
        child: Column(
          children: [
            AppPhoneField(),
            Spacer(),
            LoadingButton(
                onPressed: onPressed,
                child: Text('Proceed', style: AppTextStyle.pryBtnStyle))
          ],
        ),
      ),
    );
  }
}
