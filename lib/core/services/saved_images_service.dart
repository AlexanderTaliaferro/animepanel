import 'package:hive_flutter/hive_flutter.dart';
import '../models/saved_image.dart';

class SavedImagesService {
  static const String _boxName = 'saved_images';
  Box<Map>? _box;

  Future<void> init() async {
    _box = await Hive.openBox<Map>(_boxName);
    // Clear incompatible old data (migration for thumbnailUrl field)
    await _migrateData();
  }

  /// Migrate old data format to new format
  Future<void> _migrateData() async {
    if (_box == null) return;

    final keysToRemove = <String>[];
    for (final key in _box!.keys) {
      try {
        final json = _box!.get(key);
        if (json is Map) {
          final jsonMap = Map<String, dynamic>.from(json);
          // Check if thumbnailUrl exists, if not, mark for removal
          if (!jsonMap.containsKey('thumbnailUrl')) {
            keysToRemove.add(key.toString());
          }
        }
      } catch (e) {
        // If any error parsing, mark for removal
        keysToRemove.add(key.toString());
      }
    }

    // Remove incompatible entries
    for (final key in keysToRemove) {
      await _box!.delete(key);
    }
  }

  Box<Map> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('SavedImagesService not initialized');
    }
    return _box!;
  }

  /// Save an image
  Future<void> saveImage(SavedImage image) async {
    await box.put(image.id, image.toJson());
  }

  /// Check if an image is saved
  bool isSaved(String imageId) {
    return box.containsKey(imageId);
  }

  /// Remove a saved image
  Future<void> removeSavedImage(String imageId) async {
    await box.delete(imageId);
  }

  /// Get all saved images
  List<SavedImage> getAllSavedImages() {
    final images = <SavedImage>[];
    for (final json in box.values) {
      try {
        final savedImage = SavedImage.fromJson(Map<String, dynamic>.from(json));
        images.add(savedImage);
      } catch (e) {
        // Skip corrupted entries
        print('Error loading saved image: $e');
      }
    }
    images.sort((a, b) => b.savedAt.compareTo(a.savedAt));
    return images;
  }

  /// Get a saved image by ID
  SavedImage? getSavedImage(String imageId) {
    final json = box.get(imageId);
    if (json == null) return null;
    try {
      return SavedImage.fromJson(Map<String, dynamic>.from(json));
    } catch (e) {
      print('Error loading saved image $imageId: $e');
      return null;
    }
  }

  /// Get count of saved images
  int get savedCount => box.length;

  /// Clear all saved images
  Future<void> clearAll() async {
    await box.clear();
  }
}
