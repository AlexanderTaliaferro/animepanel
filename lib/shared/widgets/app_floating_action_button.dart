import 'package:flutter/material.dart';
import '../../features/upload/upload_screen.dart';
import 'expandable_logo_fab.dart';

/// Application-wide floating action button with navigation logic
class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableLogoFab(
      onBookmarkTap: () => _showComingSoon(context, 'Bookmarks'),
      onUploadTap: () => _navigateToUpload(context),
      onKeyboardTap: () => _showComingSoon(context, 'Keyboard shortcuts'),
    );
  }

  void _navigateToUpload(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UploadScreen(),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature - Coming soon!')),
    );
  }
}
