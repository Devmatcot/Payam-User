import '/packages.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'src/features/onboarding/presentation/views/splash_screen.dart';

Future<void> main() async {
  // await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  // SocketService();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ProviderScope(child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: AssetConstants.appName,
              theme: AppTheme.medium,
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigatorKey.myKey,
              home: child,
            );
          },
          // child: //const SplashScreen()
          
          ),
    );
  }
}
