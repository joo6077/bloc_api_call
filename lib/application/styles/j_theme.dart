import 'package:flutter/material.dart';

class JTextTheme {
  static get light => const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff282C30),
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          color: Color(0xff495057),
        ),
        titleSmall: TextStyle(
          fontSize: 13,
          color: Color(0xff7E848A),
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
      );
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.primary,
    required this.disable,
    required this.surface,
    required this.font1,
    required this.font2,
    required this.font3,
    required this.font4,
    required this.background,
  });
  final Color? primary;
  final Color? disable;
  final Color? surface;
  final Color? font1;
  final Color? font2;
  final Color? font3;
  final Color? font4;
  final Color? background;
  @override
  CustomColors copyWith({
    Color? primary,
    Color? disable,
    Color? surface,
    Color? font1,
    Color? font2,
    Color? font3,
    Color? font4,
    Color? background,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      disable: disable ?? this.disable,
      surface: surface ?? this.surface,
      font1: font1 ?? this.font1,
      font2: font2 ?? this.font2,
      font3: font3 ?? this.font3,
      font4: font4 ?? this.font4,
      background: background ?? this.background,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      primary: Color.lerp(primary, other.primary, t),
      disable: Color.lerp(disable, other.disable, t),
      surface: Color.lerp(surface, other.surface, t),
      font1: Color.lerp(font1, other.font1, t),
      font2: Color.lerp(font2, other.font2, t),
      font3: Color.lerp(font3, other.font3, t),
      font4: Color.lerp(font4, other.font4, t),
      background: Color.lerp(background, other.background, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'primary: $primary, disable: $disable, surface: $disable, background: $background'
      ')';
  // the light theme
  static const light = CustomColors(
    primary: Color(0xff2A7DE1),
    disable: Color(0xFFE1E4E7),
    surface: Color(0xffffffff),
    font1: Color(0xff495057),
    font2: Color(0xff7E848A),
    font3: Color(0xffE1E4E7),
    font4: Color(0xffADB5BD),
    background: Color(0xffefefef),
  );
  // the dark theme
  static const dark = CustomColors(
    primary: Colors.blueAccent,
    disable: Color(0xFFa6b6c6),
    surface: Color(0xffffffff),
    font1: Color(0xffffffff),
    font2: Color(0xffffffff),
    font3: Color(0xffffffff),
    font4: Color(0xffffffff),
    background: Color(0xffefefef),
  );
}
