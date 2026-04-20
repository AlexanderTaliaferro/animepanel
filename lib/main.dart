import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'features/home/home_screen.dart';
import 'core/services/saved_images_service.dart';
import 'core/providers/saved_images_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize SavedImagesService
  final savedImagesService = SavedImagesService();
  await savedImagesService.init();

  runApp(
    ProviderScope(
      overrides: [
        savedImagesServiceProvider.overrideWithValue(savedImagesService),
      ],
      child: const PanelReactApp(),
    ),
  );
}

class PanelReactApp extends StatelessWidget {
  const PanelReactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PanelReact',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9500), // Orange
          brightness: Brightness.dark,
          surface: const Color(0xFF000000), // Black
          surfaceContainer: const Color(0xFF0A1628), // Dark blue
        ),
        scaffoldBackgroundColor: const Color(0xFF000000), // Black
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
