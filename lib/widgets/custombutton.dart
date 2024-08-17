// ignore_for_file: must_be_immutable

import 'package:fyrebox/core/app_export.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton(
      {super.key,
      required this.title,
      required this.ontap,
      required this.height,
      required this.width,
      this.color,
      required this.borderColor});
  String title;
  double height;
  double width;
  VoidCallback ontap;
  Color? color;
  Color borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height.v,
        width: width.h,
        margin: EdgeInsets.only(left: 7.h),
        decoration: BoxDecoration(
            color: color ?? appTheme.blue500.withOpacity(0.1),
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.h)),
        child: Center(
          child: Text(title.tr, style: theme.textTheme.labelLarge),
        ),
      ),
    );
  }
}
