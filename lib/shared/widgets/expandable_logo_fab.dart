import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/my_colors.dart';
import '../../core/providers/fab_state_provider.dart';

class ExpandableLogoFab extends ConsumerStatefulWidget {
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
  ConsumerState<ExpandableLogoFab> createState() => _ExpandableLogoFabState();
}

class _ExpandableLogoFabState extends ConsumerState<ExpandableLogoFab>
    with SingleTickerProviderStateMixin {
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

    // Initialize animation state based on global provider state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isExpanded = ref.read(fabExpandedProvider);
      if (isExpanded) {
        _controller.value = 1.0;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    final currentState = ref.read(fabExpandedProvider);
    final newState = !currentState;

    // Update global state
    ref.read(fabExpandedProvider.notifier).state = newState;

    // Animate
    if (newState) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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

          // Main logo button with frame animation
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: _toggle,
              child: AnimatedBuilder(
                animation: _expandAnimation,
                builder: (context, child) {
                  // Map animation value (0.0 to 1.0) to frame index (9 to 1)
                  // When closed (0.0) -> frame 9
                  // When open (1.0) -> frame 1
                  final frameIndex = 9 - (_expandAnimation.value * 8).round();

                  return Image.asset(
                    'assets/images/animeLogoAnimation/anime$frameIndex.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  );
                },
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
