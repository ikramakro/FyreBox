import 'package:fyrebox/widgets/customCheckbox.dart';

import '../../core/app_export.dart';
import 'provider/rigister_provider.dart';

class RigisterScreen extends StatefulWidget {
  const RigisterScreen({super.key});

  @override
  RigisterScreenState createState() => RigisterScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RigisterProvider(),
      child: const RigisterScreen(),
    );
  }
}

class RigisterScreenState extends State<RigisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.08),
                  Image.asset(
                    ImageConstant.imgFyreboxLogo,
                    height: 100,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.08),
                  Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Full Name Field
                        Consumer<RigisterProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.nameController,
                              decoration: const InputDecoration(
                                hintText: 'Full Name',
                                filled: true,
                                fillColor: Color.fromARGB(255, 252, 205, 204),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your full name";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Email Field
                        Consumer<RigisterProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.userNameController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Color.fromARGB(255, 252, 205, 204),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                        .hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Password Field
                        Consumer<RigisterProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.passwordController,
                              obscureText: provider.isShowPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 252, 205, 204),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(provider.isShowPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: provider.changePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return "Password must be at least 6 characters long";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Confirm Password Field
                        Consumer<RigisterProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.confirmPasswordController,
                              obscureText: provider.isShowPassword,
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                                filled: true,
                                fillColor: Color.fromARGB(255, 252, 205, 204),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value != provider.passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Country Dropdown
                        // Consumer<RigisterProvider>(
                        //   builder: (context, provider, child) {
                        //     return DropdownButtonFormField<String>(
                        //       items: countries,
                        //       onChanged: (value) {
                        //         // provider.selectedCountry = value!;
                        //       },
                        //       decoration: const InputDecoration(
                        //         hintText: 'Country',
                        //         filled: true,
                        //         fillColor: Color.fromARGB(255, 252, 205, 204),
                        //         contentPadding: EdgeInsets.symmetric(
                        //             horizontal: 24.0, vertical: 16.0),
                        //         border: OutlineInputBorder(
                        //           borderSide: BorderSide.none,
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(50)),
                        //         ),
                        //       ),
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return "Please select a country";
                        //         }
                        //         return null;
                        //       },
                        //     );
                        //   },
                        // ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Consumer<RigisterProvider>(
                                  builder: (context, provider, child) =>
                                      CustomCheckbox(
                                          isSignUp: true,
                                          ontap: () {
                                            NavigatorService.pushNamed(
                                                AppRoutes.termScreen);
                                          },
                                          value: provider.term,
                                          firsttext: 'I accept the ',
                                          secondtext: 'terms and conditions',
                                          onChanged: (v) {
                                            provider.setterm();
                                          }),
                                )
                              ],
                            )),
                        // Terms and Conditions Checkbox
                        // Consumer<RigisterProvider>(
                        //   builder: (context, provider, child) {
                        //     return Row(
                        //       children: [
                        //         Checkbox(
                        //           value: provider.term,
                        //           onChanged: (value) {
                        //             provider.setterm();
                        //           },
                        //         ),
                        //         const Text("I accept the terms and conditions"),
                        //       ],
                        //     );
                        //   },
                        // ),
                        const SizedBox(height: 16.0),

                        // Sign Up Button
                        ElevatedButton(
                          onPressed: () {
                            registerUser(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 241, 46, 43),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(150, 58),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign Up"),
                        ),
                        const SizedBox(height: 16.0),

                        // Navigate to Login
                        TextButton(
                          onPressed: () {
                            NavigatorService.goBack();
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  registerUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Provider.of<RigisterProvider>(context, listen: false)
          .callLoginDeviceAuth();
    }
  }
}
 










// import 'package:fyrebox/widgets/customCheckbox.dart';

// import '../../core/app_export.dart';
// import '../../core/utils/validation_functions.dart';
// import '../../widgets/custom_text_form_field.dart';
// import 'provider/rigister_provider.dart';

// class RigisterScreen extends StatefulWidget {
//   const RigisterScreen({super.key});
//   @override
//   RigisterScreenState createState() => RigisterScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RigisterProvider(),
//       child: const RigisterScreen(),
//     );
//   }
// }

// class RigisterScreenState extends State<RigisterScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         extendBodyBehindAppBar: true,
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           width: double.maxFinite,
//           height: double.maxFinite,
//           decoration: BoxDecoration(
//             color: appTheme.whiteA700,
//             image: DecorationImage(
//               image: AssetImage(
//                 ImageConstant.imgLoginScreen,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: SizedBox(
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 52.h),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgFyreboxLogo,
//                         height: 100.h,
//                         width: double.maxFinite,
//                         fit: BoxFit.contain,
//                       ),
//                       SizedBox(height: 80.h),
//                       _buildLoginForm(context)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginForm(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: appTheme.gray200),
//       width: double.maxFinite,
//       padding: EdgeInsets.only(top: 40.v),
//       child: Align(
//         alignment: Alignment.center,
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: 28.h,
//             right: 18.h,
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 4.h),
//                       child: Text(
//                         "Name".tr,
//                         style: CustomTextStyles.titleMediumBlack900_1,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 16.h),
//                       child: Selector<RigisterProvider, TextEditingController?>(
//                         selector: (context, provider) =>
//                             provider.nameController,
//                         builder: (context, userNameController, child) {
//                           return CustomTextFormField(
//                             width: 250.h,
//                             controller: userNameController,
//                             hintText: "Name".tr,
//                             alignment: Alignment.center,
//                             contentPadding:
//                                 EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
//                             validator: (value) {
//                               if (!isText(value, isRequired: true)) {
//                                 return "Pls Enter Name";
//                               }
//                               return null;
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 4.h),
//                       child: Text(
//                         "Email Address".tr,
//                         style: CustomTextStyles.titleMediumBlack900_1,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 16.h),
//                       child: Selector<RigisterProvider, TextEditingController?>(
//                         selector: (context, provider) =>
//                             provider.userNameController,
//                         builder: (context, userNameController, child) {
//                           return CustomTextFormField(
//                             width: 250.h,
//                             controller: userNameController,
//                             hintText: "Email Address".tr,
//                             alignment: Alignment.center,
//                             contentPadding:
//                                 EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
//                             validator: (value) {
//                               if (!isValidEmail(value, isRequired: true)) {
//                                 return "Pls Enter Valid Email Address";
//                               }
//                               return null;
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 4.h),
//                         child: Text(
//                           "lbl_password".tr,
//                           style: CustomTextStyles.titleMediumBlack900_1,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 20.h),
//                       child: Consumer<RigisterProvider>(
//                         builder: (context, provider, child) {
//                           return CustomTextFormField(
//                             width: 250.h,
//                             controller: provider.passwordController,
//                             hintText: "Password".tr,
//                             textInputAction: TextInputAction.done,
//                             textInputType: TextInputType.visiblePassword,
//                             suffix: InkWell(
//                               onTap: () {
//                                 provider.changePasswordVisibility();
//                               },
//                               child: Container(
//                                 margin:
//                                     EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
//                                 child: CustomImageView(
//                                   imagePath: ImageConstant.imgHide20x20,
//                                   height: 20.h,
//                                   width: 20.h,
//                                 ),
//                               ),
//                             ),
//                             suffixConstraints: BoxConstraints(
//                               maxHeight: 44.h,
//                             ),
//                             obscureText: provider.isShowPassword,
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 10.h,
//                               vertical: 4.h,
//                             ),
//                             validator: (value) {
//                               if (value == null ||
//                                   (!isValidPassword(value, isRequired: true))) {
//                                 return "Use upper, lower, number, and symbol.";
//                               }
//                               return null;
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24.h),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 4.h),
//                         child: Text(
//                           "Confirm Password".tr,
//                           style: CustomTextStyles.titleMediumBlack900_1,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 20.h),
//                       child: Consumer<RigisterProvider>(
//                         builder: (context, provider, child) {
//                           return CustomTextFormField(
//                             width: 250.h,
//                             controller: provider.confirmPasswordController,
//                             hintText: "Confirm Password".tr,
//                             textInputAction: TextInputAction.done,
//                             textInputType: TextInputType.visiblePassword,
//                             suffix: InkWell(
//                               onTap: () {
//                                 provider.changePasswordVisibility();
//                               },
//                               child: Container(
//                                 margin:
//                                     EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
//                                 child: CustomImageView(
//                                   imagePath: ImageConstant.imgHide20x20,
//                                   height: 20.h,
//                                   width: 20.h,
//                                 ),
//                               ),
//                             ),
//                             suffixConstraints: BoxConstraints(
//                               maxHeight: 34.h,
//                             ),
//                             obscureText: provider.isShowPassword,
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 10.h,
//                               vertical: 4.h,
//                             ),
//                             validator: (value) {
//                               if (value == null ||
//                                   (!isPasswordConfirmed(
//                                       provider.passwordController.text, value,
//                                       isRequired: true))) {
//                                 return "Confirm Password is not Matched";
//                               }
//                               return null;
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24.h),
              // SizedBox(
              //     height: 50,
              //     child: Row(
              //       children: [
              //         Consumer<RigisterProvider>(
              //           builder: (context, provider, child) => CustomCheckbox(
              //               isSignUp: true,
              //               ontap: () {
              //                 NavigatorService.pushNamed(AppRoutes.termScreen);
              //               },
              //               value: provider.term,
              //               text: 'I accept the term and conditioon ',
              //               onChanged: (v) {
              //                 provider.setterm();
              //               }),
              //         )
              //       ],
              //     )),
//               GestureDetector(
//                 onTap: () {
//                   // registerUser(context);
//                   NavigatorService.pushNamed(
//                     AppRoutes.registerOrganizationScreen,
//                   );
//                 },
//                 child: SizedBox(
//                   height: 40.h,
//                   width: 114.h,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           height: 50.h,
//                           width: 114.h,
//                           margin: EdgeInsets.only(top: 4.h),
//                           decoration: BoxDecoration(
//                             color: appTheme.black900,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "lbl_login".tr,
//                         style:
//                             CustomTextStyles.headlineSmallMontserratWhiteA700,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 74.h),
//               TextButton(
//                 onPressed: () {
//                   NavigatorService.goBack();
//                 },
//                 child: Text(
//                   "Have an Account".tr,
//                   style: CustomTextStyles.titleMediumBlack900,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   registerUser(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       Provider.of<RigisterProvider>(context, listen: false).callLoginDeviceAuth(
//         onSuccess: () {
//           _onLoginDeviceAuthEventSuccess(context);
//         },
//         onError: () {
//           _onLoginDeviceAuthEventError(context);
//         },
//       );
//     }
//   }

//   void _onLoginDeviceAuthEventSuccess(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.registerOrganizationScreen,
//     );
//   }

//   void _onLoginDeviceAuthEventError(BuildContext context) {}
// }
