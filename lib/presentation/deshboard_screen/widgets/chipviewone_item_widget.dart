// ignore_for_file: must_be_immutable

import '../../../core/app_export.dart';

class ChipviewoneItemWidget extends StatelessWidget {
  ChipviewoneItemWidget({
    super.key,
    required this.chipviewoneItem,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.text,
  });
  String text;
  String chipviewoneItem;
  IconData icon;
  Color color;
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: appTheme.blueGray900,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        RawChip(
          // padding:
          //     EdgeInsets.only(top: 14.h, right: 30.h, bottom: 1.h, left: 10.h),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            " $chipviewoneItem",
            style: TextStyle(
              color: appTheme.blueGray900,
              fontSize: 24.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          avatar: Container(
            height: 50.h,
            width: 50.h,
            // margin: EdgeInsets.only(right: 5.h),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 15.h,
              ),
            ),
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(
                10.h,
              )),
        ),
      ],
    );
  }
}
