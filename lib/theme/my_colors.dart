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
  static Color animeBlue = const Color(0xFF6366F1); // Indigo
  static Color mangaPink = const Color(0xFFEC4899); // Pink
  static Color accentOrange = const Color(0xFFF59E0B); // Amber

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
    if (Theme.of(context).brightness == Brightness.dark) {
      return const Color(0xFF2A2A3C); // Dark purple-gray
    } else {
      return const Color(0xFFF3F4F6); // Light gray
    }
  }

  Color _tagChipBackground() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return const Color(0xFF374151); // Dark gray
    } else {
      return const Color(0xFFE5E7EB); // Light gray
    }
  }

  Color _cardOverlay() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.black.withOpacity(0.6);
    } else {
      return Colors.black.withOpacity(0.5);
    }
  }

  Color _successColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return const Color(0xFF10B981); // Bright green
    } else {
      return const Color(0xFF059669); // Deep green
    }
  }

  Color _errorColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return const Color(0xFFEF4444); // Bright red
    } else {
      return const Color(0xFFDC2626); // Deep red
    }
  }

  Color _displayColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color _reverseDisplayColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
