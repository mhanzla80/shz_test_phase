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
    final borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: AppTheme.primary),
      borderRadius: BorderRadius.circular(8),
    );

    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme.apply(fontFamily: 'BerlinRounded');

    return baseData.copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: whiteColor,
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintStyle: baseData.textTheme.bodySmall,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        focusedErrorBorder: borderStyle,
        counterStyle: baseData.textTheme.bodySmall,
        errorStyle: baseData.textTheme.bodySmall!.copyWith(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
