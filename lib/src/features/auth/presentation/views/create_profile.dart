import 'package:payam_user/src/features/auth/presentation/views/create_passcode.dart';

import '../../../../../packages.dart';

class CreateProfileScreen extends ConsumerWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBodyScroll(
      title: 'Let’s set your Profile!',
      subTitle: 'Enter your details to setup your profile',
      child: Column(
        children: [
          AppTextField(title: 'First Name', hint: "", type: TextInputType.text),
          10.0.spacingH,
          AppTextField(title: 'Last Name', hint: "", type: TextInputType.text),
          10.0.spacingH,
          AppTextField(
              title: 'Email Address', hint: "", type: TextInputType.text),
          10.0.spacingH,
          CustomDropDown(
              title: 'Gender',
              itemsList: 'Male,Female'.split(',').toList(),
              hintText: '',
              onChange: (value) {},
              firstItem: 'Male'),
          10.0.spacingH,
          DatePicker(
            title: 'Date of Birth',
          ),
          50.0.spacingH,
          LoadingButton(
              onPressed: () {
                pushTo(context, CreatePassCodeScreen());
              },
              child: Text('Proceed', style: AppTextStyle.pryBtnStyle)),
          50.0.spacingH,
        ],
      ),
    );
  }
}
