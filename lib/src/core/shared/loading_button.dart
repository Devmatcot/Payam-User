import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/theme/colors.dart';

class LoadingButton extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? height;
  const LoadingButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.isLoading = false,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.primary,
            ),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: AppColors.primary.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12).r),
            backgroundColor: AppColors.primary,
            fixedSize: Size(MediaQuery.of(context).size.width, height ?? 55.h),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? CupertinoActivityIndicator() : child),
    );
  }
}
