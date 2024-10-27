import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

Color red(){
  return const Color(0xffC50006);
}

Color grey(){
  return const Color(0xff5a5a60);
}

final theme = ThemeData(
textTheme:  const TextTheme(
  displayLarge: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.black),
  displayMedium: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.black),
  displaySmall: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: Colors.black),
  bodyLarge: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white),
  bodyMedium: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white),
  bodySmall: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xffC50006)),
  titleLarge: TextStyle(
    fontFamily: 'RussianRail',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black),
  titleMedium: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black),
  titleSmall: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black),
  labelLarge: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Colors.white),
  labelMedium: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black38),
  labelSmall: TextStyle(
      fontFamily: 'RussianRail',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black38),

));