import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';

import '../../../packages.dart';
import '../network/dio_exception.dart';

class AppConfig {
  static const minTextScaleFactor = 1.0;
  static const maxTextScaleFactor = 1.06;



  static handleErrorMessage(DioError dioError, [Function? bttnfn]) {
    final errorMessage =
        DioExceptions.fromDioError(dioError).toString().toTitleCase();
    log(dioError.toString());
    log(dioError.requestOptions.headers.toString());
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColors.redLight,
      title: 'Error',
      message: errorMessage,
      duration: Duration(seconds: 3),
    ).show(
      NavigatorKey.myKey.currentContext!,
    );
    // showDialog(
    //   context: NavigatorKey.myKey.currentContext!,
    //   builder: (context) {
    //     return AlertDialog(
    //       // contentTextStyle: ,
    //       backgroundColor: AppColors.white,
    //       title: Center(
    //         child: Text(
    //           'Alert!',
    //           style: AppTextStyle.headline1
    //               .copyWith(fontWeight: AppFontWeight.semiBold),
    //         ),
    //       ),
    //       content: Text(
    //         errorMessage,
    //         textAlign: TextAlign.center,
    //         style: AppTextStyle.bodyText1,
    //       ),
    //       actions: [
    //         LoadingButton(
    //           onPressed: () {
    //             if (bttnfn != null) {
    //               bttnfn();
    //               pop(context);
    //             }
    //             pop(context);
    //           },
    //           child: Text(
    //             'Okay',
    //             style: AppTextStyle.pryBtnStyle,
    //           ),
    //         )
    //       ],
    //     );
    //   },
    // );
  }

  static showToast(String message,
      [Color? color, Function? bttnfn, Widget? child]) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color ?? AppColors.green,
      duration: Duration(seconds: 3),
      title: 'Message',
      message: message,
    ).show(
      NavigatorKey.myKey.currentContext!,
    );
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         backgroundColor: AppColors.white,
    //         // contentTextStyle: ,
    //         title: Center(
    //           child: Text(
    //             'Alert!',
    //             style: AppTextStyle.headline1
    //                 .copyWith(fontWeight: AppFontWeight.semiBold),
    //           ),
    //         ),
    //         content: Text(
    //           message,
    //           textAlign: TextAlign.center,
    //           style: AppTextStyle.bodyText1,
    //         ),
    //         actions: [
    //           child ??
    //               LoadingButton(
    //                 onPressed: () {
    //                   if (bttnfn != null) {
    //                     bttnfn();
    //                     pop(context);
    //                   }
    //                   pop(context);
    //                 },
    //                 child: Text(
    //                   'Okay',
    //                   style: AppTextStyle.pryBtnStyle,
    //                 ),
    //               ),
    //         ],
    //       );
    //     });
  }

  static showAlert(BuildContext context, String message,
      [Color? color, Function? bttnfn]) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // contentTextStyle: ,
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.transparent,
            title: Center(
              child: Text(
                'Alert!',
                style: AppTextStyle.headline1
                    .copyWith(fontWeight: AppFontWeight.semiBold),
              ),
            ),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyText1,
            ),
            actions: [
              LoadingButton(
                  onPressed: () {
                    if (bttnfn != null) {
                      bttnfn();
                      pop(context);
                    }
                    pop(context);
                  },
                  isLoading: false,
                  child: Text(
                    'Okay',
                    style: AppTextStyle.pryBtnStyle,
                  )),
            ],
          );
        });
  }
}
