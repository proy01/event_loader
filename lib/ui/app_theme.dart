import 'package:flutter/material.dart';
final ThemeData lightTheme = ThemeData(
  fontFamily: 'Inter',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Iter',
      fontSize: 35,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: Color(0xFF120D26),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Iter',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.2083,
      color: Color(0xFF120D26),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Iter',
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: Color(0xFF120D26),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Iter',
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: Color(0xFF120D26),
    ),
    labelLarge: TextStyle(
      fontFamily: 'Iter',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color(0xFF0D0C26),
    ),
    labelMedium: TextStyle(
      fontFamily: 'Iter',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Color(0xFF5669FF),
    ),
    labelSmall: TextStyle(
      fontFamily: 'Iter',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Color(0xFF706E8F),
    )
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF120D26),
    size: 25,
    weight: 2
  )
);