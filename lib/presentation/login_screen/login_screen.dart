// import 'package:fluttertoast/fluttertoast.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: const LoginScreen(),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLoginScreen,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 52.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFyreboxLogo,
                        height: 100.h,
                        width: double.maxFinite,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 80.h),
                      _buildLoginForm(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appTheme.gray200),
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 40.v),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
            left: 28.h,
            right: 18.h,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Email          ".tr,
                        style: CustomTextStyles.titleMediumBlack900_1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Selector<LoginProvider, TextEditingController?>(
                        selector: (context, provider) =>
                            provider.userNameController,
                        builder: (context, userNameController, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: userNameController,
                            hintText: "Email Address ".tr,
                            alignment: Alignment.center,
                            contentPadding:
                                EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
                            validator: (value) {
                              if (!isValidEmail(value, isRequired: true)) {
                                return "Pls Enter Valid Email Address";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          "lbl_password".tr,
                          style: CustomTextStyles.titleMediumBlack900_1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Consumer<LoginProvider>(
                        builder: (context, provider, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: provider.passwordController,
                            hintText: "Password".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: InkWell(
                              onTap: () {
                                provider.changePasswordVisibility();
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgHide20x20,
                                  height: 20.h,
                                  width: 20.h,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 34.h,
                            ),
                            obscureText: provider.isShowPassword,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 4.h,
                            ),
                            validator: (value) {
                              // if (value == null ||
                              //     (!isValidPassword(value, isRequired: true))) {
                              //   return "err_msg_please_enter_valid_password";
                              // }
                              return null;
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  loginUser(context);
                },
                child: SizedBox(
                  height: 40.h,
                  width: 114.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 50.h,
                          width: 114.h,
                          margin: EdgeInsets.only(top: 4.h),
                          decoration: BoxDecoration(
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                      Text(
                        "lbl_login".tr,
                        style:
                            CustomTextStyles.headlineSmallMontserratWhiteA700,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 74.h),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.signUpScreen,
                  );
                },
                child: Text(
                  "lbl_create_account".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Provider.of<LoginProvider>(context, listen: false).callLoginDeviceAuth(
        onSuccess: () {
          _onLoginDeviceAuthEventSuccess(context);
        },
        onError: () {
          _onLoginDeviceAuthEventError(context);
        },
      );
    }
  }

  void _onLoginDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.rootScreen,
    );
  }

  void _onLoginDeviceAuthEventError(BuildContext context) {}
}
