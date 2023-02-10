import 'package:flutter/material.dart';

class JTextTheme {
  static get light => TextTheme(
        titleLarge: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          color: Colors.grey[700],
        ),
        titleSmall: TextStyle(
          fontSize: 15,
          color: Colors.grey[500],
        ),
        bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
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
    required this.background,
  });
  final Color? primary;
  final Color? disable;
  final Color? surface;
  final Color? background;
  @override
  CustomColors copyWith({
    Color? primary,
    Color? disable,
    Color? surface,
    Color? background,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      disable: disable ?? this.disable,
      surface: surface ?? this.surface,
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
    disable: Color(0xFFa6b6c6),
    surface: Color(0xffffffff),
    background: Color(0xffdc3545),
  );
  // the dark theme
  static const dark = CustomColors(
    primary: Colors.blueAccent,
    disable: Color(0xFFa6b6c6),
    surface: Color(0xffffffff),
    background: Color(0xffe74c3c),
  );
}
