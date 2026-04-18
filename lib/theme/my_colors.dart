import 'package:flutter/material.dart';

/// Dynamic color system for PanelReact app
/// Provides theme-aware colors that adapt to light/dark mode
class MyColors {
  MyColors(BuildContext this.context);

  final BuildContext context;

  // Core theme colors
  late Color primary = _primary();
  late Color secondary = _secondary();
  late Color tertiary = _tertiary();
  late Color surface = _surface();
  late Color surfaceContainer = _surfaceContainer();
  late Color surfaceContainerHigh = _surfaceContainerHigh();
  late Color onSurface = _onSurface();
  late Color onSurfaceVariant = _onSurfaceVariant();
  late Color inversePrimary = _inversePrimary();

  // Custom colors for PanelReact
  late Color searchBarFill = _searchBarFill();
  late Color tagChipBackground = _tagChipBackground();
  late Color cardOverlay = _cardOverlay();
  late Color successColor = _successColor();
  late Color errorColor = _errorColor();
  late Color displayColor = _displayColor();
  late Color reverseDisplayColor = _reverseDisplayColor();
  late Color shadow = _shadow();

  // Static anime/manga theme colors
  static Color darkBlue = const Color(0xFF0A1628); // Dark blue panels
  static Color accentOrange = const Color(0xFFFF9500); // Orange highlights
  static Color accentBlue =
      const Color.fromARGB(255, 75, 189, 212); // Light blue text/icons
  static Color pureBlack = const Color(0xFF000000); // Black background

  // Base theme getters
  Color _primary() => Theme.of(context).colorScheme.primary;
  Color _secondary() => Theme.of(context).colorScheme.secondary;
  Color _tertiary() => Theme.of(context).colorScheme.tertiary;
  Color _surface() => Theme.of(context).colorScheme.surface;
  Color _surfaceContainer() => Theme.of(context).colorScheme.surfaceContainer;
  Color _surfaceContainerHigh() =>
      Theme.of(context).colorScheme.surfaceContainerHigh;
  Color _onSurface() => Theme.of(context).colorScheme.onSurface;
  Color _onSurfaceVariant() => Theme.of(context).colorScheme.onSurfaceVariant;
  Color _inversePrimary() => Theme.of(context).colorScheme.inversePrimary;
  Color _shadow() => Theme.of(context).colorScheme.shadow;

  // Custom color implementations
  Color _searchBarFill() {
    return const Color(0xFF0A1628); // Dark blue
  }

  Color _tagChipBackground() {
    return const Color(0xFF0A1628); // Dark blue
  }

  Color _cardOverlay() {
    return const Color(0xFF0A1628).withOpacity(0.85); // Dark blue overlay
  }

  Color _successColor() {
    return const Color(0xFFFF9500); // Orange highlight
  }

  Color _errorColor() {
    return const Color(0xFFFF6B6B); // Soft red for errors
  }

  Color _displayColor() {
    return Colors.white; // White text on black background
  }

  Color _reverseDisplayColor() {
    return Colors.black;
  }
}
