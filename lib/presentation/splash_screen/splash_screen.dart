// import 'package:flutter/material.dart';
import '../../core/app_export.dart';
// import 'models/splash_model.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );
  @override
  SplashScreenState createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  // Retrieve the boolean value
  PrefUtils prefUtils = PrefUtils();

  @override
  void initState() {
    super.initState();
    bool isDarkMode = prefUtils.getBoolValue('isLogin');
    print('Is isLogin: $isDarkMode');
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        isDarkMode ? AppRoutes.rootScreen : AppRoutes.loginScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildLogoSection(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogoSvgFile3,
            height: 212.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 16.h),
          )
        ],
      ),
    );
  }
}
