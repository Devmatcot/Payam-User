// import 'dart:io';

// import 'package:url_launcher/url_launcher.dart';

// import '../../../../../packages.dart';

// class UpdateAppVersion extends StatelessWidget {
//   const UpdateAppVersion({super.key});
//   _launchToStore() {
//     if (Platform.isAndroid) {
//       _launchInBrowser(
//           "https://play.google.com/store/apps/details?id=gov.ng.enairaspeedwallet.app");
//     } else if (Platform.isIOS) {
//       _launchInBrowser(
//           "https://apps.apple.com/us/app/enaira-speed-wallet/id6448214153");
//     } else {
//       _launchInBrowser("https://enaira.gov.ng/");
//     }
//   }

//   Future<void> _launchInBrowser(String url) async {
//     if (!await launchUrl(
//       Uri.parse(url),
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0).r,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               30.0.spacingH,
//               Center(
//                 child: SvgWidget(AssetConstants.logobanner),
//               ),
//               Spacer(),
//               Container(
//                 height: 70.h,
//                 width: 70.h,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15).r,
//                     boxShadow: const [
//                       BoxShadow(
//                           blurRadius: 6,
//                           color: AppColors.black25,
//                           offset: Offset(0, 6))
//                     ],
//                     color: AppColors.primary),
//                 child: Padding(
//                     padding: const EdgeInsets.all(5.0).r,
//                     child: const ImageWidget('app_logo')
//                     // SvgWidget(
//                     //   AssetConstants.applogo,
//                     //   color: AppColors.white,
//                     // ),
//                     ),
//               ),
//               30.0.spacingH,
//               Text(
//                 'Update your application to the latest version',
//                 style: AppTextStyle.bodyText1
//                     .copyWith(fontSize: 35.sp, fontWeight: AppFontWeight.bold),
//               ),
//               10.0.spacingH,
//               Text(
//                 'A brand new version of the BellBank app is available in the ${Platform.isAndroid ? 'Play Store' : 'App Store'}. Please update your app to use all of our amazing features.',
//                 style: AppTextStyle.bodyText1,
//               ),
//               const Spacer(),
//               LoadingButton(
//                 isLoading: false,
//                 onPressed: () {
//                   _launchToStore();
//                 },
//                 child: Text(
//                   'Update now',
//                   style: AppTextStyle.primaryButtonStyle,
//                 ),
//               ),
//               30.0.spacingH,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
