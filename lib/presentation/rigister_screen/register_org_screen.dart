import 'package:fyrebox/presentation/rigister_screen/register_org_screen.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/rigister_provider.dart';

class RegisterOrganizationScreen extends StatefulWidget {
  const RegisterOrganizationScreen({super.key});
  @override
  RegisterOrganizationScreenState createState() =>
      RegisterOrganizationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RigisterProvider(),
      child: const RegisterOrganizationScreen(),
    );
  }
}

class RegisterOrganizationScreenState
    extends State<RegisterOrganizationScreen> {
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
        appBar: AppBar(
          title: const Text('Organization Screen '),
        ),
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
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgFyreboxLogo,
                      //   height: 100.h,
                      //   width: double.maxFinite,
                      //   fit: BoxFit.contain,
                      // ),
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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Organization Name".tr,
                        style: CustomTextStyles.titleMediumBlack900_1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Selector<RigisterProvider, TextEditingController?>(
                        selector: (context, provider) =>
                            provider.orgnameController,
                        builder: (context, userNameController, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: userNameController,
                            hintText: "Organization Name".tr,
                            alignment: Alignment.center,
                            contentPadding:
                                EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
                            // validator: (value) {
                            //   if (!isText(value, isRequired: true)) {
                            //     return "Pls Enter Name";
                            //   }
                            //   return null;
                            // },
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
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Email Address".tr,
                        style: CustomTextStyles.titleMediumBlack900_1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Selector<RigisterProvider, TextEditingController?>(
                        selector: (context, provider) =>
                            provider.userNameController,
                        builder: (context, userNameController, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: userNameController,
                            hintText: "msg_enter_user_name".tr,
                            alignment: Alignment.center,
                            contentPadding:
                                EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
                            // validator: (value) {
                            //   if (!isValidEmail(value, isRequired: true)) {
                            //     return "Pls Enter Valid Email Address";
                            //   }
                            //   return null;
                            // },
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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          "Phone Number".tr,
                          style: CustomTextStyles.titleMediumBlack900_1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Consumer<RigisterProvider>(
                        builder: (context, provider, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: provider.passwordController,
                            hintText: "Phone Number".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            // suffix: InkWell(
                            //   onTap: () {
                            //     provider.changePasswordVisibility();
                            //   },
                            //   child: Container(
                            //     margin:
                            //         EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
                            //     child: CustomImageView(
                            //       imagePath: ImageConstant.imgHide20x20,
                            //       height: 20.h,
                            //       width: 20.h,
                            //     ),
                            //   ),
                            // ),

                            suffixConstraints: BoxConstraints(
                              maxHeight: 34.h,
                            ),
                            // obscureText: provider.isShowPassword,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 4.h,
                            ),
                            // validator: (value) {
                            //   if (value == null ||
                            //       (!isValidPassword(value, isRequired: true))) {
                            //     return "Enter a password";
                            //   }
                            //   return null;
                            // },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          "VAT Number".tr,
                          style: CustomTextStyles.titleMediumBlack900_1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Consumer<RigisterProvider>(
                        builder: (context, provider, child) {
                          return CustomTextFormField(
                            width: 236.h,
                            controller: provider.confirmPasswordController,
                            hintText: "VAT Number".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            // suffix: InkWell(
                            //   onTap: () {
                            //     provider.changePasswordVisibility();
                            //   },
                            //   child: Container(
                            //     margin:
                            //         EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
                            //     child: CustomImageView(
                            //       imagePath: ImageConstant.imgHide20x20,
                            //       height: 20.h,
                            //       width: 20.h,
                            //     ),
                            //   ),
                            // ),

                            // suffixConstraints: BoxConstraints(
                            //   maxHeight: 34.h,
                            // ),
                            // obscureText: provider.isShowPassword,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 4.h,
                            ),
                            // validator: (value) {
                            //   if (value == null ||
                            //       (!isPasswordConfirmed(
                            //           provider.passwordController.text, value,
                            //           isRequired: true))) {
                            //     return "Confirm Password is Matched";
                            //   }
                            //   return null;
                            // },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          "Type".tr,
                          style: CustomTextStyles.titleMediumBlack900_1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: SizedBox(
                        height: 60.v,
                        width: 220.h,
                        child: Consumer<RigisterProvider>(
                          builder: (context, provider, child) => CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(left: 16.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgArrowdropdownfilled,
                                height: 20.h,
                                width: 24.h,
                              ),
                            ),
                            onChanged: (value) {
                              // provider.onChanged(value.title);
                            },
                            hintText: "Organization Type".tr,
                            hintStyle: theme.textTheme.bodyLarge!,
                            items: provider.orgTypeDropdownItemList ?? [],
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 18.h,
                            ),
                            boxDecoration: BoxDecoration(
                              color: appTheme.black900.withOpacity(0.48),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  // registerUser(context);
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
                  NavigatorService.goBack();
                },
                child: Text(
                  "Have an Account".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  registerUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Provider.of<RigisterProvider>(context, listen: false).callLoginDeviceAuth(
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
    // NavigatorService.pushNamed(
    //   AppRoutes.rootScreen,
    // );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const RegisterOrganizationScreen()));
  }

  void _onLoginDeviceAuthEventError(BuildContext context) {}
}
