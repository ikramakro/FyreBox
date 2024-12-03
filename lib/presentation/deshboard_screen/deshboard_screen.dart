import 'package:easy_image_viewer/easy_image_viewer.dart';

import '../../core/app_export.dart';
import '../../core/utils/constant.dart';
import 'provider/deshboard_provider.dart';

class DeshboardScreen extends StatefulWidget {
  const DeshboardScreen({super.key});

  @override
  State<DeshboardScreen> createState() => _DeshboardScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeshboardProvider(),
      child: const DeshboardScreen(),
    );
  }
}

class _DeshboardScreenState extends State<DeshboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeshboardProvider(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                          left: 28.h,
                          right: 18.h,
                        ),
                        child: Column(
                          children: [
                            _buildTodaySalesSummary(
                              context,
                            ),
                            SizedBox(height: 24.h),
                            _buildEvacuationMapSection(context)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 4.h)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTodaySalesSummary(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // margin: EdgeInsets.only(right: 4.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 15.h,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_today_s_sales".tr,
            style: CustomTextStyles.titleLargeGray900,
          ),
          SizedBox(height: 6.h),
          SizedBox(height: 20.h),
          Consumer<DeshboardProvider>(
            builder: (context, provider, child) {
              if (provider.model.sTATUS == "ERROR") {
                return Text('Error: ${provider.model.errorDescription}');
              }

              List count = [
                provider.model.dBDATA?.totalMyAlerts.toString() ?? '',
                provider.model.dBDATA?.totalMyDevices.toString() ?? '',
                provider.model.dBDATA?.totalMyDueInvoices.toString() ?? '',
                provider.model.dBDATA?.totalMyVisitors.toString() ?? ''
              ];
              List name = ['Total Alerts', 'Total Devices', 'Total Visitors'];
              List icon = [Icons.warning, Icons.devices, Icons.person];

              List bgColor = [
                appTheme.pink50,
                appTheme.orange50,
                appTheme.purple50
              ];
              List color = [
                const Color.fromARGB(255, 16, 78, 129),
                const Color.fromARGB(255, 106, 19, 122),
                const Color.fromARGB(255, 21, 78, 22),
              ];
              List navigator = [
                3,
                2,
                4,
              ];
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.h,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 2 / 2.5,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => NavigatorService.pushNamed(
                          AppRoutes.rootScreen,
                          arguments: navigator[index]),
                      child: _buildStatCard(
                          name[index], count[index], color[index], '0'));
                },
              );
            },
          ),
          SizedBox(height: 28.h)
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String count, Color color, String percentage) {
    return Card(
      color: color.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, color: color),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 28.0, fontWeight: FontWeight.bold, color: color),
          ),
          // Text(
          //   percentage,
          //   style: TextStyle(fontSize: 16.0, color: color),
          // ),
        ],
      ),
    );
  }

  // Widget _buildTodaySalesSummary(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.only(right: 4.h),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 30.h,
  //       vertical: 22.h,
  //     ),
  //     decoration: AppDecoration.outlineGray.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder20,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "lbl_today_s_sales".tr,
  //           style: CustomTextStyles.titleLargeGray900,
  //         ),
  //         SizedBox(height: 6.h),
  //         SizedBox(height: 42.h),
  //         Consumer<DeshboardProvider>(
  //           builder: (context, provider, child) {
  //             if (provider.model.sTATUS == "ERROR") {
  //               return Text('Error: ${provider.model.errorDescription}');
  //             }
  //             // You can replace the below Wrap with your actual data representation
  //             return Wrap(
  //               runSpacing: 58.h,
  //               spacing: 58.h,
  //               children: List<Widget>.generate(
  //                 4,
  //                 (index) {
  //                   List count = [
  //                     provider.model.dBDATA?.totalMyAlerts ?? '',
  //                     provider.model.dBDATA?.totalMyDevices ?? '',
  //                     provider.model.dBDATA?.totalMyDueInvoices ?? '',
  //                     provider.model.dBDATA?.totalMyVisitors ?? ''
  //                   ];
  //                   List name = [
  //                     'Total Alerts',
  //                     'Total Devices',
  //                     'Total DueInvoices',
  //                     'Total Visitors'
  //                   ];
  //                   return ChipviewoneItemWidget(
  //                     text: name[index],
  //                     chipviewoneItem: count[index],
  //                     icon: Icons.add,
  //                     backgroundColor: Colors.amber,
  //                     color: Colors.blue,
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //         ),
  //         SizedBox(height: 28.h)
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTodaySalesSummary(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.only(right: 4.h),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 30.h,
  //       vertical: 22.h,
  //     ),
  //     decoration: AppDecoration.outlineGray.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder20,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "lbl_today_s_sales".tr,
  //           style: CustomTextStyles.titleLargeGray900,
  //         ),
  //         SizedBox(height: 6.h),
  //         SizedBox(height: 42.h),
  //         Container(
  //           width: double.maxFinite,
  //           margin: EdgeInsets.only(
  //             left: 14.h,
  //             right: 6.h,
  //           ),
  //           child: Consumer<DeshboardProvider>(
  //             builder: (context, provider, child) {
  //               return Wrap(
  //                 runSpacing: 58.h,
  //                 spacing: 58.h,
  //                 children: List<Widget>.generate(
  //                   4,
  //                   (index) {
  //                     return ChipviewoneItemWidget(
  //                       chipviewoneItem: '100',
  //                       icon: Icons.add,
  //                       backgroundColor: Colors.amber,
  //                       color: Colors.blue,
  //                     );
  //                   },
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         SizedBox(height: 28.h)
  //       ],
  //     ),
  //   );
  // }

  Widget _buildEvacuationMapSection(BuildContext context) {
    print(
        '232323232323232333039458034584059850843098509999999999==============================${dbData?.orgEvacuationMap}');
    return InkWell(
      onTap: () {
        final imageProvider = Image.network(
                'https://fyreboxhub.com/assets/images/${dbData?.orgEvacuationMap ?? ''}')
            .image;
        showImageViewer(
          context,
          imageProvider,
          onViewerDismissed: () {
            print("dismissed");
          },
          doubleTapZoomable: true,
        );
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(right: 4.h),
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 18.h,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl_evacuation_map".tr,
                style: CustomTextStyles.titleLargeGray900,
              ),
            ),
            SizedBox(height: 6.h),
            Consumer<DeshboardProvider>(builder: (context, provider, child) {
              return CustomImageView(
                imagePath:
                    'https://fyreboxhub.com/assets/images/${dbData?.orgEvacuationMap ?? ''}',
                height: 268.h,
                width: double.maxFinite,
              );
            })
          ],
        ),
      ),
    );
  }
}
