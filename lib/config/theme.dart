

import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/app_colors.dart';

ThemeData appTheme()
{
  return ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: AppColors.primaryColor
  );
}