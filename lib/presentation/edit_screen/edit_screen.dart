import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/edit_model.dart';
import 'provider/edit_provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key})
      : super(
          key: key,
        );
  @override
  EditScreenState createState() => EditScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProvider(),
      child: EditScreen(),
    );
  }
}

class EditScreenState extends State<EditScreen> {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: _buildAppBar(context),
                    ),
                    SizedBox(height: 26.h),
                    _buildInputSection(context),
                    SizedBox(height: 8.h),
                    _buildTextFieldSection(context),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Selector<EditProvider, EditModel?>(
                        selector: (context, provider) => provider.editModelObj,
                        builder: (context, editModelObj, child) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(left: 16.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgArrowdropdownfilled,
                                height: 24.h,
                                width: 24.h,
                              ),
                            ),
                            hintText: "lbl_label".tr,
                            items: editModelObj?.dropdownItemList ?? [],
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 16.h,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildFormGroupSection(context),
                    SizedBox(height: 24.h),
                    _buildRadioGroupSection(context),
                    SizedBox(height: 24.h),
                    _buildSwitchSection(context),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      height: 36.h,
                      width: 84.h,
                      text: "lbl_action2".tr.toUpperCase(),
                      margin: EdgeInsets.only(left: 16.h),
                      buttonStyle: CustomButtonStyles.outlineBlack,
                      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                      alignment: Alignment.centerLeft,
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.h)
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 10.h,
          bottom: 10.h,
        ),
      ),
      title: AppbarTitle(
        text: "lbl_fyrebox".tr,
        margin: EdgeInsets.only(left: 36.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgAvatarLg,
          margin: EdgeInsets.only(
            top: 10.h,
            right: 15.h,
            bottom: 10.h,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  Widget _buildInputSection(BuildContext context) {
    return Container(
      height: 62.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Selector<EditProvider, TextEditingController?>(
            selector: (context, provider) => provider.edittextController,
            builder: (context, edittextController, child) {
              return CustomTextFormField(
                controller: edittextController,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.all(12.h),
                // borderDecoration: TextFormFieldStyleHelper.outlineBlue,
                filled: false,
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 16.h,
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 2.h,
                    width: 38.h,
                    margin: EdgeInsets.only(bottom: 6.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "lbl_label".tr,
                        style: CustomTextStyles.bodySmallBlue500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFieldSection(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 6.h),
              padding: EdgeInsets.only(
                left: 10.h,
                top: 14.h,
                bottom: 14.h,
              ),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_value".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 66.h)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        height: 2.h,
                        width: 38.h,
                        margin: EdgeInsets.only(bottom: 6.h),
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "lbl_label".tr,
                            style: CustomTextStyles.bodySmall_1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 116.h),
                Text(
                  "lbl_helper_text".tr,
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormGroupSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_label".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Selector<EditProvider, bool?>(
              selector: (context, provider) => provider.englishkeyTwo,
              builder: (context, englishkeyTwo, child) {
                return CustomCheckboxButton(
                  text: "lbl_label".tr,
                  value: englishkeyTwo,
                  onChange: (value) {
                    context.read<EditProvider>().changeCheckBox(value);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Selector<EditProvider, bool?>(
              selector: (context, provider) => provider.englishkeytwo,
              builder: (context, englishkeytwo, child) {
                return CustomCheckboxButton(
                  text: "lbl_label".tr,
                  value: englishkeytwo,
                  onChange: (value) {
                    context.read<EditProvider>().changeCheckBox1(value);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            "lbl_helper_text".tr,
            style: theme.textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget _buildRadioGroupSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 28.h,
        right: 18.h,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgHiddenBlack900,
                        height: 24.h,
                        width: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "lbl_label".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                Consumer<EditProvider>(
                  builder: (context, provider, child) {
                    return CustomRadioButton(
                      text: "lbl_label".tr,
                      value: "lbl_label".tr,
                      groupValue: provider.radioGroup,
                      onChange: (value) {
                        provider.changeRadioButton(value);
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSwitchSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 38.h,
            width: 58.h,
          ),
          Text(
            "lbl_label".tr,
            style: theme.textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
