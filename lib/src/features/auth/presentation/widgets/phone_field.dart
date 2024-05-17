// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../packages.dart';

class AppPhoneField extends StatelessWidget {
  final TextEditingController controller;
  AppPhoneField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  GlobalKey<FormState> fieldKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18).r,
          child: Row(
            children: [
              SvgWidget(AssetConstants.flag),
              5.0.spacingW,
              Text(
                '+234',
                style: AppTextStyle.bodyText1,
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12).r),
        ),
        10.0.spacingW,
        Expanded(
            child: Form(
          key: fieldKey,
          onChanged: () => fieldKey.currentState?.validate(),
          child: AppTextField(
            hint: 'e.g 7011223344',
            type: TextInputType.phone,
            controller: controller,
            validator: (value) {
              String phone = '0$value';
              if (value!.isEmpty) {
                return 'This field is required';
              } else if (!phone.isValidPhone) {
                return 'Valid phone number is required';
              }

              return null;
            },
            maxLenth: 10,
          ),
        ))
      ],
    );
  }
}
