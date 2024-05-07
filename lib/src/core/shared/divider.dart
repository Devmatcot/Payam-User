import '../../../packages.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0).r, color: AppColors.grey),
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r, color: AppColors.gray),
    );
  }
}
