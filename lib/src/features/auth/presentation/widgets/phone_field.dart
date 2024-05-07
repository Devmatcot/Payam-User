
import '../../../../../packages.dart';

class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: AppTextField(
                hint: '7011223344', type: TextInputType.phone))
      ],
    );
  }
}
