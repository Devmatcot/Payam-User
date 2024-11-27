import '../../../../../packages.dart';
import '../../../auth/presentation/views/login_screen.dart';
import '../../model/onboard_model.dart';

class OnboardingScreen extends ConsumerWidget {
  OnboardingScreen({super.key});
  final PageController _page = PageController();
  final List<OnBoardModel> board = [
    OnBoardModel(
        title: 'Mobile banking just for you',
        subTitle: 'Send money to friends and family with just a few taps.'),
    OnBoardModel(
        title: 'Quick & seamless bank transfers',
        subTitle: 'Pay bills, buy airtime with the Payam App'),
    // OnBoardModel(
    //     title: 'BellBank and eNaira swap',
    //     subTitle:
    //         'Send money to friends and family with just a few taps.'),
  ];

  updateFirstTime(WidgetRef ref) async {
    ref.read(localStorageProvider).set(Endpoints.firstTime, '1');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                height: 530.h,
                // color: Colors.amber,
                child: PageView.builder(
                  itemCount: board.length,
                  controller: _page,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ImageWidget(
                        '${index + 1}',
                        height: 400.h,
                      ),
                      10.0.spacingH,
                      // Text(
                      //   board[index].title,
                      //   textAlign: TextAlign.center,
                      //   style: AppTextStyle.headline1.copyWith(
                      //       fontSize: 25.h, fontWeight: AppFontWeight.semiBold),
                      // ),
                      // 10.0.spacingH,
                      Text(
                        board[index].subTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.headline1.copyWith(
                            fontSize: 25.h, fontWeight: AppFontWeight.medium),
                      ),
                    ],
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _page,
                count: board.length,
                effect: WormEffect(
                    dotHeight: 3,
                    dotWidth: 20.w,
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.primary),
              ),
              Spacer(),
              LoadingButton(
                isLoading: false,
                child: Text(
                  'Register new account',
                  style: AppTextStyle.pryBtnStyle,
                ),
                onPressed: () {
                  updateFirstTime(ref);
                  pushTo(context, RegisterScreen());
                },
              ),
              15.0.spacingH,
              SecondaryButton(
                onTap: () {
                  updateFirstTime(ref);
                  pushReplacementTo(context, LoginScreen());
                },
                child: Text(
                  'Login to your account',
                  style: AppTextStyle.secBtnStyle,
                ),
              ),
              // SvgWidget(AssetConstants.lincense)
              // ImageWidget(AssetConstants.lincense)
            ],
          ),
        ),
      ),
    );
  }
}
