import 'package:flutter/cupertino.dart';
import 'package:payam_user/src/features/settings/presentation/views/setting_screen.dart';

import '/packages.dart';
import '../../../transaction/presentation/views/transaction_screen.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    Future.delayed(Duration.zero).then((_) {});
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // provider.start();
    return Scaffold(
      body: PageView(
        // scrollBehavior: ,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DashBoardScreen(),
          TransactionScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
          height: 85.h,
          backgroundColor: AppColors.white,
          currentIndex: currentIndex,
          onTap: (value) {
            _pageController.jumpToPage(value);
            setState(() {
              currentIndex = value;
            });

            // print(value);
            // provider.navigatePage(value);
          },
          items: [
            NaviItem(AssetConstants.home, 0, currentIndex, 'Home'),
            NaviItem(AssetConstants.history, 1, currentIndex, 'History'),
            // NaviItem(AssetConstants.analytic, 2, currentIndex, 'Analytics'),
            // BottomNavigationBarItem(icon: Container()),
            // NaviItem(AssetConstants.card, 3, currentIndex, 'Cards'),
            NaviItem(AssetConstants.profile, 2, currentIndex, 'Profile'),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

BottomNavigationBarItem NaviItem(
    String icons, int myIndex, int pageIndex, String title) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: Column(
        children: [
          10.0.spacingH,
          SizedBox(
            height: 30.h,
            child: SvgWidget(icons,
                color: myIndex == pageIndex
                    ? AppColors.primary
                    : AppColors.appDark),
          ),
          // 3.0.spacingH,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1).r,
            child: CircleAvatar(
              radius: 2.h,
              backgroundColor: myIndex == pageIndex
                  ? AppColors.primary
                  : AppColors.transparent,
            ),
          ),
          Text(
            title,
            style: AppTextStyle.bodyText1.copyWith(
                fontSize: 14,
                color: myIndex == pageIndex
                    ? AppColors.primary
                    : AppColors.appDark),
          )
        ],
      ),
    ),
  );
}
