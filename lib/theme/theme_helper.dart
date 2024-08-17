import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.whiteA700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.gray400,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.87),
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.87),
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900.withOpacity(0.6),
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 13.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900.withOpacity(0.87),
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => const Color(0XFF000000);

  // Blue
  Color get blue500 => const Color(0XFF2196F3);

  // BlueGray
  Color get blueGray500 => const Color(0XFF457B9D);
  Color get blueGray50001 => const Color(0XFF737791);
  Color get blueGray800 => const Color(0XFF474B51);
  Color get blueGray900 => const Color(0XFF151D48);
  Color get blueGray90001 => const Color(0XFF363636);

  // DeepOrange
  Color get deepOrangeA100 => const Color(0XFFFF947A);

  // DeepPurple
  Color get deepPurpleA100 => const Color(0XFFBF83FF);

  // Gray
  Color get gray200 => const Color(0XFFE9E8E8);
  Color get gray20080 => const Color(0X80EDEDED);
  Color get gray400 => const Color(0XFFBDBDBD);
  Color get gray50 => const Color(0XFFF8F9FA);
  Color get gray5001 => const Color(0XFFFAFAFA);
  Color get gray5002 => const Color(0XFFF8FAFC);
  Color get gray700 => const Color(0XFF5B5B5B);
  Color get gray800 => const Color(0XFF424242);
  Color get gray900 => const Color(0XFF05004E);

  // Green
  Color get green50 => const Color(0XFFDCFCE7);
  Color get green500 => const Color(0XFF3CD856);

  // Orange
  Color get orange50 => const Color(0XFFFFF4DE);

  // Pink
  Color get pink300 => const Color(0XFFFA5A7D);
  Color get pink50 => const Color(0XFFFFE2E5);

  // Purple
  Color get purple50 => const Color(0XFFF3E8FF);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);
}
