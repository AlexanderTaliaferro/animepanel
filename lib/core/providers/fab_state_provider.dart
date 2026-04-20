import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Global state provider for the FAB expanded/collapsed state
/// This allows the FAB to maintain its state across page navigation
final fabExpandedProvider = StateProvider<bool>((ref) => false);
