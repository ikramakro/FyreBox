import 'dart:io';

import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'provider/rigister_provider.dart';

class RegisterOrganizationScreen extends StatefulWidget {
  final String? email;
  const RegisterOrganizationScreen({super.key, required this.email});

  @override
  RegisterOrganizationScreenState createState() =>
      RegisterOrganizationScreenState();

  static Widget builder(BuildContext context, {String? email}) {
    return ChangeNotifierProvider(
      create: (context) => RigisterProvider(),
      child: RegisterOrganizationScreen(
        email: email,
      ),
    );
  }
}

class RegisterOrganizationScreenState
    extends State<RegisterOrganizationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Organization Details'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Organization Logo
                // _buildFieldTitle("Organization Logo"),
                _buildImagePicker(
                  context,
                  title: "Upload Logo",
                  onPick: () {
                    context.read<RigisterProvider>().pickImageForLogo();
                  },
                  image: context.watch<RigisterProvider>().organizationLogo,
                ),
                const SizedBox(height: 16.0),

                // Evacuation Map
                // _buildFieldTitle("Evacuation Map"),
                _buildImagePicker(
                  context,
                  title: "Upload Evacuation Map",
                  onPick: () {
                    context.read<RigisterProvider>().pickImageForMap();
                  },
                  image: context.watch<RigisterProvider>().evacuationMapImage,
                ),
                const SizedBox(height: 16.0),

                // Organization Name
                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      controller: provider.orgnameController,

                      decoration: const InputDecoration(
                        hintText: 'Organization Name',
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 205, 204),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        // suffixIcon: IconButton(
                        //   icon: Icon(provider.isShowPassword
                        //       ? Icons.visibility_off
                        //       : Icons.visibility),
                        //   onPressed: provider.changePasswordVisibility,
                        // ),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.length < 6) {
                      //     return "Password must be at least 6 characters long";
                      //   }
                      //   return null;
                      // },
                    );
                  },
                ),

                const SizedBox(height: 16.0),

                // Email
                // Consumer<RigisterProvider>(
                //   builder: (context, provider, child) {
                //     return CustomTextFormField(
                //       controller: provider.userNameController,
                //       hintText: "Email Address",
                //       textInputType: TextInputType.emailAddress,
                //       validator: (value) {
                //         if (value == null ||
                //             !RegExp(r".+@.+\..+").hasMatch(value)) {
                //           return "Please enter a valid email address";
                //         }
                //         return null;
                //       },
                //     );
                //   },
                // ),

                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    provider.userNameController =
                        TextEditingController(text: widget.email);
                    return TextFormField(
                      controller: provider.userNameController,
                      decoration: const InputDecoration(
                        hintText: 'Email Address',
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 205, 204),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16.0),

                // Phone Number
                // Consumer<RigisterProvider>(
                //   builder: (context, provider, child) {
                //     return CustomTextFormField(
                //       controller: provider.phoneController,
                //       hintText: "Phone Number",
                //       textInputType: TextInputType.phone,
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return "Please enter phone number";
                //         }
                //         return null;
                //       },
                //     );
                //   },
                // ),

                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      controller: provider.phoneController,
                      // obscureText: provider.isShowPassword,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 205, 204),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16.0),

                // VAT Number
                // Consumer<RigisterProvider>(
                //   builder: (context, provider, child) {
                //     return CustomTextFormField(
                //       controller: provider.vatController,
                //       hintText: "VAT Number",
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return "Please enter VAT number";
                //         }
                //         return null;
                //       },
                //     );
                //   },
                // ),

                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      controller: provider.vatController,
                      decoration: const InputDecoration(
                        hintText: 'Vat Number',
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 205, 204),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      controller: provider.addressController,
                      decoration: const InputDecoration(
                        hintText: 'Address',
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 205, 204),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16.0),

                // Organization Type
                // _buildFieldTitle("Organization Type"),
                Consumer<RigisterProvider>(
                  builder: (context, provider, child) {
                    return CustomDropDown(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 252, 205, 204),
                      items: provider.orgTypeDropdownItemList,
                      hintText: "Select Organization Type",
                      onChanged: (value) {
                        provider.selectedOrgType = value.id.toString();
                      },
                      borderDecoration: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24.0),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<RigisterProvider>().registerOrganization();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(255, 241, 46, 43),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 58),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Submit",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context,
      {required String title,
      required VoidCallback onPick,
      required String? image}) {
    return GestureDetector(
      onTap: onPick,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 252, 205, 204),
        ),
        child: image != null
            ? Image.file(
                File(image),
                fit: BoxFit.cover,
              )
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
      ),
    );
  }
}










// import 'dart:io';

// import '../../core/app_export.dart';
// import '../../widgets/custom_drop_down.dart';
// import '../../widgets/custom_text_form_field.dart';
// import 'provider/rigister_provider.dart';

// class RegisterOrganizationScreen extends StatefulWidget {
//   const RegisterOrganizationScreen({super.key});
//   @override
//   RegisterOrganizationScreenState createState() =>
//       RegisterOrganizationScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RigisterProvider(),
//       child: const RegisterOrganizationScreen(),
//     );
//   }
// }

// class RegisterOrganizationScreenState
//     extends State<RegisterOrganizationScreen> {
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
//         appBar: AppBar(
//           title: const Text('Organization Screen '),
//         ),
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
//               height: SizeUtils.height,
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 52.h),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // CustomImageView(
//                         //   imagePath: ImageConstant.imgFyreboxLogo,
//                         //   height: 100.h,
//                         //   width: double.maxFinite,
//                         //   fit: BoxFit.contain,
//                         // ),
//                         SizedBox(height: 80.h),
//                         _buildLoginForm(context)
//                       ],
//                     ),
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
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 _buildFieldTitle("Organization Logo"),
//                 _buildImagePicker(
//                   context,
//                   title: "Upload Logo",
//                   onPick: () {
//                     context.read<RigisterProvider>().pickImageForLogo();
//                   },
//                   image: context.watch<RigisterProvider>().organizationLogo,
//                 ),
//                 const SizedBox(height: 16),

//                 // Evacuation Map Picker
//                 _buildFieldTitle("Evacuation Map"),
//                 _buildImagePicker(
//                   context,
//                   title: "Upload Evacuation Map",
//                   onPick: () {
//                     context.read<RigisterProvider>().pickImageForMap();
//                   },
//                   image: context.watch<RigisterProvider>().evacuationMapImage,
//                 ),
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 4.h),
//                         child: Text(
//                           "Organization Name".tr,
//                           style: CustomTextStyles.titleMediumBlack900_1,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 16.h),
//                         child:
//                             Selector<RigisterProvider, TextEditingController?>(
//                           selector: (context, provider) =>
//                               provider.orgnameController,
//                           builder: (context, userNameController, child) {
//                             return CustomTextFormField(
//                               width: 236.h,
//                               controller: userNameController,
//                               hintText: "Organization Name".tr,
//                               alignment: Alignment.center,
//                               contentPadding:
//                                   EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
//                               // validator: (value) {
//                               //   if (!isText(value, isRequired: true)) {
//                               //     return "Pls Enter Name";
//                               //   }
//                               //   return null;
//                               // },
//                             );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 4.h),
//                         child: Text(
//                           "Email Address".tr,
//                           style: CustomTextStyles.titleMediumBlack900_1,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 16.h),
//                         child:
//                             Selector<RigisterProvider, TextEditingController?>(
//                           selector: (context, provider) =>
//                               provider.userNameController,
//                           builder: (context, userNameController, child) {
//                             return CustomTextFormField(
//                               width: 236.h,
//                               controller: userNameController,
//                               hintText: "msg_enter_user_name".tr,
//                               alignment: Alignment.center,
//                               contentPadding:
//                                   EdgeInsets.fromLTRB(10.h, 2.h, 10.h, 8.h),
//                               // validator: (value) {
//                               //   if (!isValidEmail(value, isRequired: true)) {
//                               //     return "Pls Enter Valid Email Address";
//                               //   }
//                               //   return null;
//                               // },
//                             );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 4.h),
//                           child: Text(
//                             "Phone Number".tr,
//                             style: CustomTextStyles.titleMediumBlack900_1,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.h),
//                         child: Consumer<RigisterProvider>(
//                           builder: (context, provider, child) {
//                             return CustomTextFormField(
//                               width: 236.h,
//                               controller: provider.phoneController,
//                               hintText: "Phone Number".tr,
//                               textInputAction: TextInputAction.done,
//                               textInputType: TextInputType.visiblePassword,
//                               // suffix: InkWell(
//                               //   onTap: () {
//                               //     provider.changePasswordVisibility();
//                               //   },
//                               //   child: Container(
//                               //     margin:
//                               //         EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
//                               //     child: CustomImageView(
//                               //       imagePath: ImageConstant.imgHide20x20,
//                               //       height: 20.h,
//                               //       width: 20.h,
//                               //     ),
//                               //   ),
//                               // ),

//                               suffixConstraints: BoxConstraints(
//                                 maxHeight: 34.h,
//                               ),
//                               // obscureText: provider.isShowPassword,
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 10.h,
//                                 vertical: 4.h,
//                               ),
//                               // validator: (value) {
//                               //   if (value == null ||
//                               //       (!isValidPassword(value, isRequired: true))) {
//                               //     return "Enter a password";
//                               //   }
//                               //   return null;
//                               // },
//                             );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 15.h),
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 4.h),
//                           child: Text(
//                             "VAT Number".tr,
//                             style: CustomTextStyles.titleMediumBlack900_1,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.h),
//                         child: Consumer<RigisterProvider>(
//                           builder: (context, provider, child) {
//                             return CustomTextFormField(
//                               width: 236.h,
//                               controller: provider.vatController,
//                               hintText: "VAT Number".tr,
//                               textInputAction: TextInputAction.done,
//                               textInputType: TextInputType.visiblePassword,
//                               // suffix: InkWell(
//                               //   onTap: () {
//                               //     provider.changePasswordVisibility();
//                               //   },
//                               //   child: Container(
//                               //     margin:
//                               //         EdgeInsets.fromLTRB(16.h, 4.h, 10.h, 4.h),
//                               //     child: CustomImageView(
//                               //       imagePath: ImageConstant.imgHide20x20,
//                               //       height: 20.h,
//                               //       width: 20.h,
//                               //     ),
//                               //   ),
//                               // ),

//                               // suffixConstraints: BoxConstraints(
//                               //   maxHeight: 34.h,
//                               // ),
//                               // obscureText: provider.isShowPassword,
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 10.h,
//                                 vertical: 4.h,
//                               ),
//                               // validator: (value) {
//                               //   if (value == null ||
//                               //       (!isPasswordConfirmed(
//                               //           provider.passwordController.text, value,
//                               //           isRequired: true))) {
//                               //     return "Confirm Password is Matched";
//                               //   }
//                               //   return null;
//                               // },
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 4.h),
//                           child: Text(
//                             "Type".tr,
//                             style: CustomTextStyles.titleMediumBlack900_1,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.h),
//                         child: SizedBox(
//                           height: 60.v,
//                           width: 220.h,
//                           child: Consumer<RigisterProvider>(
//                             builder: (context, provider, child) =>
//                                 CustomDropDown(
//                               borderDecoration: const OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent)),
//                               icon: Container(
//                                 margin: EdgeInsets.only(left: 16.h),
//                                 child: CustomImageView(
//                                   imagePath:
//                                       ImageConstant.imgArrowdropdownfilled,
//                                   height: 20.h,
//                                   width: 24.h,
//                                 ),
//                               ),
//                               onChanged: (value) {
//                                 provider.onChanged(value.id.toString());
//                               },
//                               hintText: "Organization Type".tr,
//                               hintStyle: theme.textTheme.bodyLarge!,
//                               items: provider.orgTypeDropdownItemList ?? [],
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 12.h,
//                                 vertical: 18.h,
//                               ),
//                               boxDecoration: BoxDecoration(
//                                 color: appTheme.black900.withOpacity(0.48),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24.h),
//                 GestureDetector(
//                   onTap: () {
//                     // registerUser(context);
//                   },
//                   child: SizedBox(
//                     height: 40.h,
//                     width: 114.h,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: Container(
//                             height: 50.h,
//                             width: 114.h,
//                             margin: EdgeInsets.only(top: 4.h),
//                             decoration: BoxDecoration(
//                               color: appTheme.black900,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "lbl_login".tr,
//                           style:
//                               CustomTextStyles.headlineSmallMontserratWhiteA700,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50.h),
//                 TextButton(
//                   onPressed: () {
//                     NavigatorService.goBack();
//                   },
//                   child: Text(
//                     "Have an Account".tr,
//                     style: CustomTextStyles.titleMediumBlack900,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFieldTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildImagePicker(BuildContext context,
//       {required String title,
//       required VoidCallback onPick,
//       required String? image}) {
//     return GestureDetector(
//       onTap: onPick,
//       child: Container(
//         width: 250.h,
//         height: 150.v,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.grey[200],
//         ),
//         child: image != null
//             ? Image.file(
//                 File(image),
//                 fit: BoxFit.cover,
//               )
//             : Center(
//                 child: Text(
//                   title,
//                   style: const TextStyle(color: Colors.black54),
//                 ),
//               ),
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
//     // NavigatorService.pushNamed(
//     //   AppRoutes.rootScreen,
//     // );
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const RegisterOrganizationScreen()));
//   }

//   void _onLoginDeviceAuthEventError(BuildContext context) {}
// }
