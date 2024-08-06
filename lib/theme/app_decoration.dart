import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Elevation decorations
  static BoxDecoration get elevation1 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.2),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          )
        ],
      );

  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5002,
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black900.withOpacity(0.23),
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.black900.withOpacity(0.12),
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray200,
        border: Border.all(
          color: appTheme.gray50,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray20080,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );

  // Fs decorations
  static BoxDecoration get fs457B9D => BoxDecoration(
        color: appTheme.blueGray500,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}
