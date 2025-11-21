import 'package:flutter/material.dart';
import 'package:testekobe/shared/ui/theme/app_text_theme.dart';

class UiConfig {
  static ThemeData theme = ThemeData(
    primaryColor: Colors.deepPurple,
    textTheme: AppTextTheme.textTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}
