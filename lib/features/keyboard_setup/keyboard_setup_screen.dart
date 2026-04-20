import 'package:flutter/material.dart';
import '../../theme/my_colors.dart';
import '../../shared/widgets/app_floating_action_button.dart';

class KeyboardSetupScreen extends StatelessWidget {
  const KeyboardSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return Scaffold(
      backgroundColor: colors.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero section
              Center(
                child: Column(
                  children: [
                    const Image(
                        image: AssetImage(
                            'assets/images/animeLogoAnimation/anime1.png'),
                        width: 120,
                        height: 120),
                    Text(
                      'Panel react',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colors.displayColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Anime & manga reaction panels — right from your keyboard.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Setup title
              Text(
                'Setup',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colors.displayColor,
                ),
              ),

              const SizedBox(height: 24),

              // Step 1
              _buildStep(
                colors: colors,
                number: '1',
                title: 'Add the keyboard',
                body:
                    'Settings → General → Keyboard → Keyboards → Add New Keyboard → Anime Panel',
              ),

              const SizedBox(height: 20),

              // Step 2
              _buildStep(
                colors: colors,
                number: '2',
                title: 'Enable Full Access',
                body:
                    'Tap Anime Panel in the keyboards list, then toggle Allow Full Access. This lets the keyboard fetch images.',
              ),

              const SizedBox(height: 20),

              // Step 3
              _buildStep(
                colors: colors,
                number: '3',
                title: 'Switch keyboards',
                body:
                    'In any app, hold the 🌐 key or tap it to switch to Anime Panel.',
              ),

              const SizedBox(height: 20),

              // Step 4
              _buildStep(
                colors: colors,
                number: '4',
                title: 'Search & copy',
                body:
                    'Type an emotion or character name. Tap any panel to copy it, then paste into your chat.',
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: const AppFloatingActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
    );
  }

  Widget _buildStep({
    required MyColors colors,
    required String number,
    required String title,
    required String body,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Number circle
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: MyColors.accentOrange,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colors.displayColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                body,
                style: TextStyle(
                  fontSize: 14,
                  color: colors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
