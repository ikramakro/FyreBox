import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_checkbox_button.dart';
import 'provider/privacy_provider.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key})
      : super(
          key: key,
        );
  @override
  PrivacyScreenState createState() => PrivacyScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PrivacyProvider(),
      child: PrivacyScreen(),
    );
  }
}

class PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 12.h),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_patent_copyright2".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                          TextSpan(
                            text: "\n",
                            style:
                                CustomTextStyles.bodyMediumMontserratBlack900,
                          ),
                          TextSpan(
                            text: "msg_this_acknowledgment".tr,
                            style:
                                CustomTextStyles.bodyMediumMontserratBlack900,
                          ),
                          TextSpan(
                            text: "\n",
                            style: CustomTextStyles.labelLargeSemiBold_1,
                          ),
                          TextSpan(
                            text: "msg_notice_i_hereby".tr,
                            style: CustomTextStyles.labelLargeBold,
                          )
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              SizedBox(height: 42.h),
              _buildAcceptanceCheckbox(context),
              SizedBox(height: 42.h),
              _buildStatusColumn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAcceptanceCheckbox(BuildContext context) {
    return Selector<PrivacyProvider, bool?>(
      selector: (context, provider) => provider.acceptanceCheckbox,
      builder: (context, acceptanceCheckbox, child) {
        return CustomCheckboxButton(
          text: "msg_i_accept_this_patent".tr,
          value: acceptanceCheckbox,
          textStyle: CustomTextStyles.titleSmallGray800,
          onChange: (value) {
            context.read<PrivacyProvider>().changeCheckBox(value);
          },
        );
      },
    );
  }

  Widget _buildStatusColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 26.h),
            padding: EdgeInsets.symmetric(
              horizontal: 34.h,
              vertical: 2.h,
            ),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.h,
                    vertical: 4.h,
                  ),
                  decoration: AppDecoration.fs457B9D.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "lbl_assigned".tr,
                        style: CustomTextStyles.bodySmallPoppinsWhiteA700,
                      )
                    ],
                  ),
                ),
                Text(
                  "lbl_on_going".tr,
                  style: CustomTextStyles.bodySmallPoppinsBluegray800,
                ),
                Text(
                  "lbl_delivered".tr,
                  style: CustomTextStyles.bodySmallPoppinsBluegray800,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
