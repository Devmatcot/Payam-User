// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../packages.dart';

class PhoneOTPScreen extends ConsumerWidget {
  final String phoneNumber;
  PhoneOTPScreen({
    required this.phoneNumber,
  });
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBody(
      title: 'Enter Verification Code',
      subTitle:
          'Enter your the 6-digit Verification code sent to your Mobile Number 0${phoneNumber.replaceRange(6, phoneNumber.length, 'XXXX')}',
      child: Expanded(
        child: Column(
          children: [
            // AppPhoneField(),
            PinCodeField(
              controller: controller,
              obscure: false,
            ),
            Text(
              'Resend 1:00',
              style: AppTextStyle.bodyText2,
            ),
            Spacer(),
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                bool isEnable = value.text.length == 6;
                return LoadingButton(
                    isLoading: ref.watch(authControllerProvider),
                    onPressed: isEnable
                        ? () {
                            ref
                                .read(authControllerProvider.notifier)
                                .verifySMSOTP(context, phoneNumber,
                                    controller.text.trim(), false);

                            // pushTo(context, CreateProfileScreen());
                          }
                        : null,
                    child: Text('Proceed', style: AppTextStyle.pryBtnStyle));
              },
            )
          ],
        ),
      ),
    );
  }
}
