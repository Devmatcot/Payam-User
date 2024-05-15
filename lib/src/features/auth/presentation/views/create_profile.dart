// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../packages.dart';

class CreateProfileScreen extends ConsumerWidget {
  final String phoneNumber;
  CreateProfileScreen({
    required this.phoneNumber,
  });
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  // final TextEditingController firstName = TextEditingController();
  String selectedGender = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDob = ref.watch(datePickerProvider);
    return ScaffoldBodyScroll(
      title: 'Let’s set your Profile!',
      subTitle: 'Enter your details to setup your profile',
      child: Column(
        children: [
          AppTextField(
              controller: firstName,
              title: 'First Name',
              hint: "Adebola",
              type: TextInputType.text),
          10.0.spacingH,
          AppTextField(
              controller: lastName,
              title: 'Last Name',
              hint: "John",
              type: TextInputType.text),
          10.0.spacingH,
          AppTextField(
              controller: emailAddress,
              title: 'Email Address',
              hint: "abc@gmail.com",
              type: TextInputType.text),
          10.0.spacingH,
          CustomDropDown(
              title: 'Gender',
              itemsList: 'Male,Female'.split(',').toList(),
              hintText: '',
              onChange: (value) {
                selectedGender = value!;
              },
              firstItem: 'Male'),
          10.0.spacingH,
          DatePicker(
            title: 'Date of Birth',
          ),
          50.0.spacingH,
          ListenableBuilder(
            listenable: Listenable.merge([emailAddress, firstName, lastName]),
            builder: (context, child) {
              bool isEnable = emailAddress.text.isValidEmail &&
                  firstName.text.isValidName &&
                  lastName.text.isValidName &&
                  userDob != null;
              return LoadingButton(
                  isLoading: ref.watch(authControllerProvider),
                  onPressed: isEnable
                      ? () {
                          ref
                              .read(authControllerProvider.notifier)
                              .createUserAcct(
                                  context: context,
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  phoneNum: phoneNumber,
                                  email: emailAddress.text,
                                  gender: selectedGender);
                          // pushTo(context, CreatePassCodeScreen());
                        }
                      : null,
                  child: Text('Proceed', style: AppTextStyle.pryBtnStyle));
            },
          ),
          50.0.spacingH,
        ],
      ),
    );
  }
}
