import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fyrebox/presentation/alerts_screen/provider/alerts_provider.dart';
import 'package:fyrebox/presentation/rigister_screen/provider/rigister_provider.dart';
import 'package:toastification/toastification.dart';

import 'core/app_export.dart';

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Model Viewer')),
//         body: const ModelViewer(
//           backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
//           src: 'assets/images/Demo.glb',
//           alt: 'A 3D model of an astronaut',
//           ar: true,
//           arModes: ['scene-viewer', 'webxr', 'quick-look'],
//           autoRotate: true,
//           iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
//           disableZoom: true,
//         ),
//       ),
//     );
//   }
// }
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
            ChangeNotifierProvider<RigisterProvider>(
              create: (context) => RigisterProvider(),
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
