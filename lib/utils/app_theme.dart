import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFea5c3c);
  static const Color accent = Color(0xFF7abe70);
  static const Color accentLight = Color(0x1A7abe70);
  static const Color darkBlueGreyColor = Color(0xFF11263c);
  static const Color lightBlueGreyColor = Color(0xff95a6ba);
  static const Color orangeColor = Color(0xFFf69955);
  static const Color lightSilverColor = Color(0xFFF5F6F8);
  static const Color silverColor = Color(0x89C9C9ff);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightShadowColor = Color(0x1a11263c);
  static const warmGrey = Color(0xff979797);

  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme.apply(fontFamily: 'BerlinRounded');
    final dividerTheme = baseData.dividerTheme.copyWith(
      color: AppTheme.lightBlueGreyColor,
      thickness: 1,
    );

    return baseData.copyWith(
      primaryColor: primary,
      dividerTheme: dividerTheme,
      backgroundColor: whiteColor,
      scaffoldBackgroundColor: whiteColor,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accent),
    );
  }
}
