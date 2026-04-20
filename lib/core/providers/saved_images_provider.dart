import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/saved_images_service.dart';
import '../models/saved_image.dart';

final savedImagesServiceProvider = Provider<SavedImagesService>((ref) {
  throw UnimplementedError('SavedImagesService must be overridden');
});

final savedImagesProvider =
    StateNotifierProvider<SavedImagesNotifier, List<SavedImage>>((ref) {
  final service = ref.watch(savedImagesServiceProvider);
  return SavedImagesNotifier(service);
});

class SavedImagesNotifier extends StateNotifier<List<SavedImage>> {
  final SavedImagesService _service;

  SavedImagesNotifier(this._service) : super([]) {
    _loadSavedImages();
  }

  void _loadSavedImages() {
    state = _service.getAllSavedImages();
  }

  Future<void> saveImage(SavedImage image) async {
    await _service.saveImage(image);
    _loadSavedImages();
  }

  Future<void> removeSavedImage(String imageId) async {
    await _service.removeSavedImage(imageId);
    _loadSavedImages();
  }

  bool isSaved(String imageId) {
    return _service.isSaved(imageId);
  }

  SavedImage? getSavedImage(String imageId) {
    return _service.getSavedImage(imageId);
  }
}
