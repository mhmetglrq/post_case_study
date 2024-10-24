import 'package:flutter/material.dart';
import 'package:post_case_study/config/extensions/context_extension.dart';

import '../items/app_colors.dart';

/// Uygulama teması
/// Uygulama fontunun ayarları, renklerin ayarları ve tema modu ayarları burada yapılır
class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.kTextColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      /// Uygulama genelinde kullanılacak text stilleri
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.037),
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.032),
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.027),
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.037),
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.027),
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.022),
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: context.dynamicHeight(0.037),
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.027),
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.022),
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: context.dynamicHeight(0.027),
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: context.dynamicHeight(0.022),
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: context.dynamicHeight(0.017),
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.027),
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.022),
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: context.dynamicHeight(0.017),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kTextColor),
    );
  }

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
  );
}
