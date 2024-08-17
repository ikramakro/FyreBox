import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../core/app_export.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: const SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  PrefUtils prefUtils = PrefUtils();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _loadData() async {
    // Load the data in the provider
     bool isLogin = prefUtils.getBoolValue('isLogin');
  //   final splashProvider = Provider.of<SplashProvider>(context, listen: false);
  //  if(isLogin){
  //   await splashProvider.loadInitialData();
  //  } 

    // Navigate after a delay
    await Future.delayed(const Duration(milliseconds: 3000));
    NavigatorService.popAndPushNamed(
      isLogin ? AppRoutes.rootScreen : AppRoutes.loginScreen,
    );
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
            imagePath: ImageConstant.imgFyreboxLogo,
            height: 212.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 16.h),
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
