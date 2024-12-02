import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toastification/toastification.dart';
import 'core/app_export.dart';
import 'presentation/alerts_screen/provider/alerts_provider.dart';

// Device Update
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
    // ?????
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(),
            ),
            // Add other providers here as needed
            // Example:
            ChangeNotifierProvider<AlertsProvider>(
              create: (context) => AlertsProvider(),
            ),
          ],
          child: ToastificationWrapper(
            child: MaterialApp(
              scaffoldMessengerKey: scaffoldKey,
              title: 'Fyrebox',
              debugShowCheckedModeBanner: false,
              theme: theme,
              navigatorKey: NavigatorService.navigatorKey,
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [Locale('en', '')],
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.routes,
            ),
          ),
        );
      },
    );
  }
}
