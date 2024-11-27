import '../../../../../packages.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  autoLogin() async {
    // LocationService location = LocationService();
    // location.checkAndRequestPermission();
    await Future.delayed(Duration(seconds: 3));
    ref.read(authControllerProvider.notifier).autoLogin(context);
    // pushToAndClearStack(context, OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.white,
              ),
              10.0.spacingH,
              Text(
                AssetConstants.appName,
                style: AppTextStyle.headline1.copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
