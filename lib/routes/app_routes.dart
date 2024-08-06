import 'package:flutter/material.dart';
import 'package:fyrebox/presentation/rigister_screen/rigister_screen.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/deshboard_screen/deshboard_screen.dart';
import '../presentation/device_screen/add_device_screen.dart';
import '../presentation/edit_screen/edit_screen.dart';
import '../presentation/login_screen/login_screen.dart';
// import '../presentation/login_screen_dark_screen/login_screen_dark_screen.dart';
import '../presentation/privacy_screen/privacy_screen.dart';
import '../presentation/root_screen/root_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/user_screen/add_org_screen.dart';
import '../presentation/user_screen/user_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  // static const String loginScreenDarkScreen = '/login_screen_dark_screen';
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/signUp_Screen';
  static const String privacyScreen = '/privacy_screen';
  static const String addOrgScreen = '/addOrgScreen';
  static const String addDeviceScreen = '/addDeviceScreen';
  static const String deshboardScreen = '/deshboard_screen';
  static const String userScreen = '/user_screen';
  static const String editScreen = '/edit_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';
  static const String rootScreen = '/rootScreen';

  static Map<String, WidgetBuilder> get routes => {
        addOrgScreen: AddOrganizationUserScreen.builder,
        addDeviceScreen: AddDeviceScreen.builder,
        rootScreen: (context) => RootScreen.builder(context,
            index: ModalRoute.of(context)?.settings.arguments as int?),
        splashScreen: SplashScreen.builder,
        // loginScreenDarkScreen: LoginScreenDarkScreen.builder,
        loginScreen: LoginScreen.builder,
        signUpScreen: RigisterScreen.builder,
        privacyScreen: PrivacyScreen.builder,
        deshboardScreen: DeshboardScreen.builder,
        userScreen: UserScreen.builder,
        editScreen: EditScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
