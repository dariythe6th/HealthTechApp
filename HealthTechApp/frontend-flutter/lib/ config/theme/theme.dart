import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFFCFFF3),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: Color(0xFF364025),
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: Color(0xFF364025),
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: Color(0xFF364025),
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      color: Color(0xFF8D957E),
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: Color(0xFFE8D957E),
      letterSpacing: 0.4,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: Color(0xFFE8D957E),
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
      color: Color(0xFF364025),
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      color: Color(0xFF4B3D1A),
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      color: Color(0xFF4B3D1A),
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      shadowColor: MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),
  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 10, horizontal: 22.5),
      ),
      minimumSize: WidgetStatePropertyAll(Size(79.5, 40)),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFDEE9D3);
        }
      }),
    ),
  ),
);
