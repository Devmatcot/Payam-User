import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/settings/presentation/views/email_otp.dart';

class EditEmailScreen extends ConsumerWidget {
  const EditEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Edit Email Address',
      child: Padding(
        padding: EdgeInsets.all(24).r,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  AppTextField(
                      title: 'Enter new email address',
                      hint: 'john@gmail.com',
                      type: TextInputType.emailAddress),
                  20.0.spacingH,
                ],
              ),
            ),
            LoadingButton(
                onPressed: () {
                  pushTo(context, EmailOtpScreen());
                },
                child: Text(
                  'Proceed',
                  style: AppTextStyle.pryBtnStyle,
                ))
          ],
        ),
      ),
    );
  }
}
