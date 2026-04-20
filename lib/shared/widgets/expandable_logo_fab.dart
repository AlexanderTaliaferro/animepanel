import 'package:flutter/material.dart';
import '../../theme/my_colors.dart';

class ExpandableLogoFab extends StatefulWidget {
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onUploadTap;
  final VoidCallback? onKeyboardTap;

  const ExpandableLogoFab({
    super.key,
    this.onBookmarkTap,
    this.onUploadTap,
    this.onKeyboardTap,
  });

  @override
  State<ExpandableLogoFab> createState() => _ExpandableLogoFabState();
}

class _ExpandableLogoFabState extends State<ExpandableLogoFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 120,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Expandable action buttons (appear from left to right)
          ..._buildExpandableButtons(),

          // Main logo button
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: _toggle,
              child: Image.asset(
                'assets/images/AnimePanelLogo.png',
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExpandableButtons() {
    final buttons = [
      _ActionButton(
        icon: Icons.keyboard,
        onTap: widget.onKeyboardTap,
        offset: 140,
      ),
      _ActionButton(
        icon: Icons.upload,
        onTap: widget.onUploadTap,
        offset: 210,
      ),
      _ActionButton(
        icon: Icons.bookmark,
        onTap: widget.onBookmarkTap,
        offset: 280,
      ),
    ];

    return buttons.map((button) {
      return AnimatedBuilder(
        animation: _expandAnimation,
        builder: (context, child) {
          return Positioned(
            left: button.offset * _expandAnimation.value,
            child: Opacity(
              opacity: _expandAnimation.value,
              child: child,
            ),
          );
        },
        child: button,
      );
    }).toList();
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double offset;

  const _ActionButton({
    required this.icon,
    this.onTap,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: MyColors.darkBlue.withAlpha(150),
          shape: BoxShape.circle,
          border: Border.all(
            color: MyColors.accentOrange,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: MyColors.accentOrange,
          size: 28,
        ),
      ),
    );
  }
}
