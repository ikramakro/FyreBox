import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}

class CustomTextStyles {
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get bodyLargeMontserratWhiteA700 =>
      theme.textTheme.bodyLarge!.montserrat.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargePoppinsBluegray50001 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.blueGray50001,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get bodyMediumMontserratBlack900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.black900,
        fontSize: 13.fSize,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.87),
      );
  static get bodySmallBlue500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue500,
      );
  static get bodySmallPoppinsBluegray800 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodySmallPoppinsWhiteA700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmall_1 => theme.textTheme.bodySmall!;
  static get headlineSmallMontserratBluegray90001 =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: appTheme.blueGray90001,
      );
  static get headlineSmallMontserratWhiteA700 =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineSmallRobotoBlack900 =>
      theme.textTheme.headlineSmall!.roboto.copyWith(
        color: appTheme.black900.withOpacity(0.87),
        fontWeight: FontWeight.w400,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSemiBold_1 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleLargeGray900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallGray800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmall_1 => theme.textTheme.titleSmall!;
}
