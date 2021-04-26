import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle headingLarge = GoogleFonts.roboto(
    color: AppColors.headingColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle headingSmall = GoogleFonts.roboto(
    color: AppColors.headingColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle textLarge = GoogleFonts.roboto(
    color: AppColors.headingColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textSmall = GoogleFonts.roboto(
    color: AppColors.headingColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle complement = GoogleFonts.roboto(
    color: AppColors.headingColor,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textRetangle = GoogleFonts.roboto(
    color: AppColors.retangleColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textLargeLight = GoogleFonts.roboto(
    color: AppColors.headingLightColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
}
