import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.child,
    this.onTap,
    this.height,
    this.bgColor,
    Key? key,
  }) : super(key: key);
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
