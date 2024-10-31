import 'package:payam_user/packages.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {required this.child, this.onTap, this.height, this.bgColor, Key? key})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  final double? height;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.border,
          side: BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12).r,
          ),
          fixedSize: Size(MediaQuery.of(context).size.width, height ?? 55.h)),
      onPressed: onTap,
      child: Center(
        child: child,
      ),
    );
  }
}

class SecondaryButtonWhite extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const SecondaryButtonWhite({this.onTap, required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 55.h,
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              border: Border.all(color: AppColors.primary)),
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.bodyText1.copyWith(color: AppColors.primary),
            ),
          )),
    );
  }
}
