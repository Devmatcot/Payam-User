import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import '/src/core/utils/extension/text_extentions.dart';

import '../../../packages.dart';
import '../network/dio_exception.dart';

class AppConfig {
  static const minTextScaleFactor = 1.0;
  static const maxTextScaleFactor = 1.06;

  static const String termsAndConditionText =
      "\nReturns and Cancellations\n\n2 Kids SA ‘Gradloup’ Money Back Guarantee\n\n1.INTRODUCTION\n\nThis User Agreement, the Mobile devices terms, and all policies and additional terms posted on and in our sites, applications, tools and services (collectively “Services”) set out the terms on which 2 Kids SA ‘Gradloup’ offers you access to and use of our Services. You can find an overview of our policies here. The Mobile devices terms, all policies and additional terms posted on and in our sites, applications, tools, and services are incorporated into this User Agreement. You agree to comply with all of the terms of this User Agreement when accessing or using our Services. The entity you are contracting with is: 2 Kids SA ‘Gradloup’, Chemin de Ballegue 55, 1066 Epalinges, Switzerland which has 100 % ownership of ‘Gradloup’ a registered trademark,. In this User Agreement, these entities are individually and collectively referred to as “2 Kids SA ,‘Gradloup’,” “we,” or “us.” Please be advised that this User Agreement contains provisions that govern how claims you and we have against each other are resolved (see Disclaimer of Warranties; Limitation of Liability and Legal Disputes provisions below). It also contains an Agreement to Arbitrate, which will, with limited exception, require you to submit claims you have against us or our agents to binding and final arbitration, unless you opt out of the Agreement to Arbitrate (see Legal Disputes, Section B (“Agreement to Arbitrate”)). Unless you opt out: (1) you will only be permitted to pursue claims against us or our agents on an individual basis, not as a plaintiff or class member in any class or representative action or proceeding and (2) you will only be permitted to seek relief (including monetary, injunctive, and declaratory relief) on an individual basis.";
  static const String privacyPolicyText = "";

  static handleErrorMessage(DioError dioError, [Function? bttnfn]) {
    final errorMessage =
        DioExceptions.fromDioError(dioError).toString().toTitleCase();
    log(dioError.toString());
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
}
