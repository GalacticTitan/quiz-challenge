import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle regular10P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.black,
      );

  static TextStyle medium10P({Color? color, TextDecoration? decoration}) => GoogleFonts.baloo2(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        decoration: decoration,
      );

  static TextStyle light12P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: color ?? AppColors.black,
      );

  static TextStyle light14P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: color ?? AppColors.black,
      );

  static TextStyle regular12P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.black,
      );

  static TextStyle medium12P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
      );

  static TextStyle medium12I({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
      );

  static TextStyle regular14P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.black,
      );

  static TextStyle medium14P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
      );

  static TextStyle medium16P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
      );

  static TextStyle medium20P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
      );    

  static TextStyle bold14P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.black,
      );

  static TextStyle bold16P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.black,
      );

  static TextStyle regular16P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.black,
      );

  static TextStyle semibold18P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );
  static TextStyle semiBold16P({Color? color,}) => GoogleFonts.baloo2(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );

  static TextStyle semiBold14P({Color? color,}) => GoogleFonts.baloo2(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );

  static TextStyle semiBold12P({Color? color,}) => GoogleFonts.baloo2(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );
  static TextStyle semiBold18P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );

  static TextStyle light10P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 10,
        fontWeight: FontWeight.w300,
        color: color ?? AppColors.black,
      );

  static TextStyle semiBold20P({Color? color}) => GoogleFonts.baloo2(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );


  static TextStyle semiBold27P({Color? color}) => GoogleFonts.baloo2(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.black,
  );

  static TextStyle semiBold24P({Color? color}) => GoogleFonts.baloo2(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.black,
  );

  static TextStyle regular12PU({Color? color})=>GoogleFonts.baloo2(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    shadows: [ Shadow(color: color?? AppColors.black, offset: const Offset(0, -1.1))],
    color: Colors.transparent,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.justGrey60,
    decorationThickness: 0.9,
  );
}
