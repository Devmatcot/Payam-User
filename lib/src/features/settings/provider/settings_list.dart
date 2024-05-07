// import '../../../../packages.dart';
// import '../../coin/presentation/views/buy_coin.dart';
// import '../../coin/presentation/views/transaction_history.dart';
// import '../model/setting_modal.dart';
// import '../presentation/views/password_screen.dart';
// import '../presentation/views/profile_details.dart';
// import '../presentation/views/support_page.dart';
// import '/src/features/auth/model/acct_enum.dart';

// final List<SettingsModel> proSettingList = [
//   SettingsModel(
//       icon: AssetConstants.myprofile,
//       title: 'My Profile',
//       page: ProfileDetailsScreen()),
//   SettingsModel(
//       icon: AssetConstants.points, title: 'Purchase Coins', page: BuyCoin()),
//   SettingsModel(
//       icon: AssetConstants.cards,
//       title: 'Transaction History',
//       page: TransactionHistory()),
//   SettingsModel(
//       icon: AssetConstants.lock,
//       title: 'Change Password',
//       page: ChangePasswordScreen()),
// ];

// // final moreSetting = [
// //   SettingsModel(
// //       icon: AssetConstants.help, title: 'Help Center', page: SupportPage()),
// //   SettingsModel(
// //     icon: AssetConstants.switch_agent,
// //     title: 'Switch to Agent',
// //     arrow: false,
// //     onTap: () {},
// //     leading: CustomSwitch(
// //       onSwitch: (va) {},
// //     ),
// //   ),
// //   SettingsModel(icon: AssetConstants.logout, title: 'Log-Out', arrow: false),
// // ];

// List<SettingsModel> moreSetting(WidgetRef ref) {
//   final moreSetting = [
//     SettingsModel(
//         icon: AssetConstants.help, title: 'Help Center', page: SupportPage()),
//     SettingsModel(
//       icon: AssetConstants.switch_agent,
//       title: 'Switch to Agent',
//       arrow: false,
//       onTap: () {
//         print('Switch');

//         ref.read(authControllerProvider.notifier).switchUser(AccountType.agent);
//       },
//       // leading: CustomSwitch(
//       //   onSwitch: (va) {
//       //     ref
//       //         .read(authControllerProvider.notifier)
//       //         .switchUser(AccountType.agent);
//       //   },
//       // ),
//     ),
//     SettingsModel(icon: AssetConstants.logout, title: 'Log-Out', arrow: false),
//   ];
//   return moreSetting;
// }

// List<SettingsModel> agentMoreSetting(WidgetRef ref) {
//   final agentMoreSetting = [
//     SettingsModel(
//         icon: AssetConstants.help, title: 'Help Center', page: SupportPage()),
//     SettingsModel(
//       icon: AssetConstants.switch_agent,
//       title: 'Switch to User',
//       // arrow: false,
//       onTap: () {
//         ref.read(authControllerProvider.notifier).switchUser(AccountType.user);
//       },
//       // leading: CustomSwitch(
//       //   onSwitch: (va) {},
//       // ),
//     ),
//     SettingsModel(icon: AssetConstants.logout, title: 'Log-Out', arrow: false),
//   ];
//   return agentMoreSetting;
// }

// final List<SettingsModel> supportList = [
//   SettingsModel(
//     icon: AssetConstants.livechat,
//     title: 'Live Chat',
//   ),
//   SettingsModel(
//     icon: AssetConstants.sms,
//     title: 'Send Via Email',
//   ),
//   SettingsModel(
//     icon: AssetConstants.user_shield,
//     title: 'Request for Escrow',
//   ),
//   SettingsModel(
//     icon: AssetConstants.help,
//     title: 'Frequently asked questions',
//   ),
// ];
