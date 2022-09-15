import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';

class AppTheme {
  const AppTheme._();

  static final _lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.blueColor1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.blueColor1,
    ),
    brightness: Brightness.light,
    backgroundColor: AppColors.whiteColor1,
    scaffoldBackgroundColor: AppColors.whiteColor1,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    errorColor: AppColors.redColor1,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blueColor1,
      centerTitle: false,
      shadowColor: AppColors.whiteColor1,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.raleway(
        color: AppColors.blackColor1,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headline2: GoogleFonts.poppins(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.blueColor1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.blueColor1,
    ),
    brightness: Brightness.light,
    backgroundColor: AppColors.whiteColor1,
    scaffoldBackgroundColor: AppColors.whiteColor1,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    errorColor: AppColors.redColor1,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blueColor1,
      centerTitle: false,
      shadowColor: AppColors.whiteColor1,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.raleway(
        color: AppColors.blackColor1,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headline2: GoogleFonts.poppins(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
  );

  static ThemeData light() {
    return _lightTheme;
  }

  static ThemeData dark() {
    return _darkTheme;
  }
}
