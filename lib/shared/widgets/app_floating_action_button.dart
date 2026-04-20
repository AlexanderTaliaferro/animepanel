import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/upload/upload_screen.dart';
import '../../features/saved_images/saved_images_screen.dart';
import '../../features/keyboard_setup/keyboard_setup_screen.dart';
import '../../features/home/home_provider.dart';
import 'expandable_logo_fab.dart';

/// Application-wide floating action button with navigation logic
class AppFloatingActionButton extends ConsumerWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandableLogoFab(
      onBookmarkTap: () => _navigateToSavedImages(context),
      onUploadTap: () => _navigateToUpload(context),
      onKeyboardTap: () => _navigateToKeyboardSetup(context),
      onDoubleTap: () => _navigateToHome(context, ref),
    );
  }

  void _navigateToHome(BuildContext context, WidgetRef ref) {
    // Navigate to home (first route)
    Navigator.of(context).popUntil((route) => route.isFirst);

    // Clear any selected tags
    ref.read(homeNotifierProvider.notifier).clear();
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
