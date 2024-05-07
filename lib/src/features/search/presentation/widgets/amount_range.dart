import '../../../../../packages.dart';

class AmountRange extends StatelessWidget {
  const AmountRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        // autofocus: true,
        style: AppTextStyle.bodyText1,
        cursorHeight: 15.h,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 17.w),
          prefixText: '₦',
          prefixStyle: TextStyle(fontFamily: 'Arial', fontSize: 15.h),
          isCollapsed: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5).r,
            borderSide: BorderSide(color: AppColors.gray),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5).r,
            borderSide: BorderSide(color: AppColors.gray),
          ),
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5).r,
            borderSide: BorderSide(color: AppColors.gray),
          ),
        ),
      ),
    );
  }
}
