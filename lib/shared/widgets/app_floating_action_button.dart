import 'package:flutter/material.dart';
import '../../features/upload/upload_screen.dart';
import '../../features/saved_images/saved_images_screen.dart';
import '../../features/keyboard_setup/keyboard_setup_screen.dart';
import 'expandable_logo_fab.dart';

/// Application-wide floating action button with navigation logic
class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableLogoFab(
      onBookmarkTap: () => _navigateToSavedImages(context),
      onUploadTap: () => _navigateToUpload(context),
      onKeyboardTap: () => _navigateToKeyboardSetup(context),
    );
  }

  void _navigateToUpload(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UploadScreen(),
      ),
    );
  }

  void _navigateToSavedImages(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SavedImagesScreen(),
      ),
    );
  }

  void _navigateToKeyboardSetup(BuildContext context) {
    // Check if we're already on the keyboard setup screen
    final currentRoute = ModalRoute.of(context);
    final isOnKeyboardScreen = currentRoute?.settings.arguments == null &&
        context.findAncestorWidgetOfExactType<KeyboardSetupScreen>() != null;

    if (isOnKeyboardScreen) {
      // Navigate back to home
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      // Navigate to keyboard setup
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const KeyboardSetupScreen(),
        ),
      );
    }
  }
}
