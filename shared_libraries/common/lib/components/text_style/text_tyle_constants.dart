import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TextStyleConstants {
  const TextStyleConstants();
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;

  static TextStyle pageTitles = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: bold,
    letterSpacing: 0.15,
  );

  static TextStyle paragraphText = TextStyle(
    fontSize: 14.0.sp,
    letterSpacing: 0.15,
  );

  static TextStyle listTitles = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: medium,
    letterSpacing: 0.15,
  );

  static TextStyle button = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: medium,
    letterSpacing: 0.15,
  );
}
