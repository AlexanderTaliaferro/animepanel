import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: PanelReactApp()));
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
