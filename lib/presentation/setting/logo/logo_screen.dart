import 'package:flutter/material.dart';
import 'package:fyrebox/core/utils/constant.dart';
import 'package:fyrebox/presentation/setting/logo/logo_provider.dart';
import 'package:fyrebox/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../profile/profile_provider.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          OrganizationProvider(), // Initialize OrganizationProvider
      child: const OrganizationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final organizationProvider =
        Provider.of<OrganizationProvider>(context); // Access provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization Settings'),
        backgroundColor: const Color(0xffd61a21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Organization Logo Section
            const Text(
              'Organization Logo:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: InkWell(
                onTap: () => organizationProvider.pickLogo(),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: organizationProvider.logo == null
                        ? CustomImageView(
                            imagePath:
                                'https://fyreboxhub.com/assets/images/${dbData?.orgLogo ?? ''}',
                            // height: 212.h,
                            // width: double.maxFinite,
                            // margin: EdgeInsets.only(right: 16.h),
                            fit: BoxFit.contain,
                          )
                        : Image.file(organizationProvider.logo!,
                            fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16.0),
            CustomElevatedButton(
              onPressed: organizationProvider.logo != null
                  ? () {
                      organizationProvider
                          .uploadLogo(); // Upload organization logo
                    }
                  : null, // Disable if no logo is selected
              text: organizationProvider.isUploadingLogo
                  ? 'Uploading Logo...'
                  : 'Upload Logo',
              buttonStyle: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xffd61a21)),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Organization Map Section
            const Text(
              'Organization Map:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: InkWell(
                onTap: () => organizationProvider.pickMap(),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: organizationProvider.map == null
                        ? CustomImageView(
                            imagePath:
                                'https://fyreboxhub.com/assets/images/${dbData?.orgEvacuationMap ?? ''}',
                            // height: 212.h,
                            // width: double.maxFinite,
                            // margin: EdgeInsets.only(right: 16.h),
                            fit: BoxFit.contain,
                          )
                        : Image.file(organizationProvider.map!,
                            fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16.0),
            CustomElevatedButton(
              onPressed: organizationProvider.map != null
                  ? () {
                      organizationProvider
                          .uploadMap(); // Upload organization map
                    }
                  : null, // Disable if no map is selected
              text: organizationProvider.isUploadingMap
                  ? 'Uploading Map...'
                  : 'Upload Map',
              buttonStyle: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xffd61a21)),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

























// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../../../core/utils/constant.dart';
// import '../../../widgets/custom_elevated_button.dart';
// import '../profile/profile_provider.dart';

// class OrganizationScreen extends StatelessWidget {
//   const OrganizationScreen({super.key});

//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProfileProvider(),
//       child: const OrganizationScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Organization Settings'),
//         backgroundColor: const Color(0xffd61a21),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Organization Logo Section
//             const Text(
//               'Organization Logo:',
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             Center(
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Center(
//                     child: CustomImageView(
//                   imagePath:
//                       'https://fyreboxhub.com/assets/images/${dbData?.orgLogo ?? ''}',
//                   // height: 212.h,
//                   // width: double.maxFinite,
//                   // margin: EdgeInsets.only(right: 16.h),
//                   fit: BoxFit.contain,
//                 )),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             CustomElevatedButton(
//               onPressed: () {
//                 // Handle logo upload action
//               },
//               text: 'Choose File',
//               buttonStyle: ButtonStyle(
//                 backgroundColor:
//                     WidgetStateProperty.all(const Color(0xffd61a21)),
//                 padding: WidgetStateProperty.all(
//                   const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                 ),
//                 textStyle: WidgetStateProperty.all(
//                   const TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24.0),
//             // Organization Map Section
//             const Text(
//               'Organization Map:',
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             Center(
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Center(
//                     child: CustomImageView(
//                   imagePath:
//                       'https://fyreboxhub.com/assets/images/${dbData?.orgEvacuationMap ?? ''}',
//                   // height: 212.h,
//                   // width: double.maxFinite,
//                   // margin: EdgeInsets.only(right: 16.h),
//                   fit: BoxFit.contain,
//                 )),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             CustomElevatedButton(
//               onPressed: () {
//                 // Handle map upload action
//               },
//               text: 'Choose File',
//               buttonStyle: ButtonStyle(
//                 backgroundColor:
//                     WidgetStateProperty.all(const Color(0xffd61a21)),
//                 padding: WidgetStateProperty.all(
//                   const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                 ),
//                 textStyle: WidgetStateProperty.all(
//                   const TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
