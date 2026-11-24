import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColor.white,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
      titleSmall: TextStyle(
        color: AppColor.yellow,
        fontSize: 14,
        fontWeight: FontWeight.w400,

      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColor.yellow,
      )
    ),
    // iconTheme: IconThemeData(
    //   color: AppColor.white,
    //   size: 24,
    // ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColor.white,
        iconSize: 24
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.yellow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        padding: EdgeInsetsGeometry.all(14),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: AppColor.darkGray,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
      prefixIconColor: AppColor.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.black, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.black, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.black, width: 1),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColor.yellow,
      unselectedItemColor: AppColor.white,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      unselectedLabelStyle: TextStyle(height: 0,fontSize: 0),
      selectedLabelStyle: TextStyle(height: 0,fontSize: 0),

      elevation: 0,
      type: BottomNavigationBarType.fixed,
    )
  );
}
