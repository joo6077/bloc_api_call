import 'package:flutter/material.dart';

class JTextTheme {
  static get light => TextTheme(
        titleLarge: const TextStyle(
          fontSize: 20,
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
    required this.warning,
    required this.danger,
  });
  final Color? primary;
  final Color? disable;
  final Color? warning;
  final Color? danger;
  @override
  CustomColors copyWith({
    Color? primary,
    Color? disable,
    Color? warning,
    Color? danger,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      disable: disable ?? this.disable,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
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
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'primary: $primary, disable: $disable, warning: $disable, danger: $danger'
      ')';
  // the light theme
  static const light = CustomColors(
    primary: Colors.blueAccent,
    disable: Color(0xFFa6b6c6),
    warning: Color(0xffffc107),
    danger: Color(0xffdc3545),
  );
  // the dark theme
  static const dark = CustomColors(
    primary: Colors.blueAccent,
    disable: Color(0xFFa6b6c6),
    warning: Color(0xfff39c12),
    danger: Color(0xffe74c3c),
  );
}
