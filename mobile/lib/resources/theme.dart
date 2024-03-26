import 'package:flutter/material.dart';

extension ColorX on Color {
  Color darken({double amount = 0.1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}

class AppColors {
  static const primary = Color(0xFF90FD8C);
  static const primaryDark = Color(0xFF377F15);
}

class AppTheme {
  static const facebookBlue = Color(0xFF4267B2);

  static ThemeData light() {
    return _build(
      brightness: Brightness.light,
      primary: AppColors.primary,
      primaryDark: AppColors.primaryDark,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      background: const Color(0xFFF1F1F1),
      error: Colors.red,
      onError: Colors.white,
    );
  }

  static ThemeData dark() {
    return _build(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      primaryDark: AppColors.primaryDark,
      onPrimary: Colors.white,
      surface: const Color(0xFF222222),
      onSurface: const Color(0xFFF8F8FD).withOpacity(0.7),
      background: const Color(0xFF121212),
      error: Colors.red,
      onError: Colors.black,
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required Color primary,
    required Color primaryDark,
    required Color onPrimary,
    required Color onSurface,
    required Color surface,
    required Color background,
    required Color error,
    required Color onError,
  }) {
    final isDark = brightness == Brightness.dark;

    final theme = ThemeData.from(
      colorScheme: ColorScheme(
        brightness: brightness,
        // primary
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: isDark ? primaryDark : primary,
        // secondary
        secondary: primary,
        onSecondary: onPrimary,
        secondaryContainer: primaryDark,
        // surface
        surface: surface,
        onSurface: onSurface,
        // background
        background: background,
        onBackground: onSurface,
        // error
        error: error,
        onError: onError,
      ),
    );

    return theme.copyWith(primaryColorDark: primaryDark);
  }
}

extension BuildContextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
