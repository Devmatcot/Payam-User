  import 'dart:ui';

import '../../../packages.dart';

Future<dynamic> bottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (context) => SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1,
            sigmaY: 1,
          ),
          child: child,
        ),
      ),
    );
  }
