import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/api/anime_panel_api.dart';
import '../../core/constants/anime_sources.dart';
import '../../shared/widgets/tag_manager.dart';
import '../../theme/my_colors.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  File? _imageFile;
  String _sourceSlug = '';
  String _type = 'anime_frame';
  final Set<String> _selectedTagSlugs = {};
  bool _uploading = false;
  String? _error;
  String? _uploadedImageId;

  final _picker = ImagePicker();
  final _sourceController = TextEditingController();

  @override
  void dispose() {
    _sourceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 2000,
        maxHeight: 2000,
      );

      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
          _error = null;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to pick image: $e';
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (_imageFile == null) {
      setState(() => _error = 'Please select an image');
      return;
    }

    setState(() {
      _uploading = true;
      _error = null;
    });

    try {
      final result = await AnimePanelApi.instance.uploadImage(
        file: _imageFile!,
        sourceSlug: _sourceSlug.trim().isEmpty ? null : _sourceSlug.trim(),
        tagSlugs: _selectedTagSlugs.toList(),
        type: _type,
      );

      setState(() {
        _uploadedImageId = result['imageId'];
        _uploading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _uploading = false;
      });
    }
  }

  void _resetForm() {
    setState(() {
      _imageFile = null;
      _sourceSlug = '';
      _sourceController.clear();
      _type = 'anime_frame';
      _selectedTagSlugs.clear();
      _error = null;
      _uploadedImageId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    if (_uploadedImageId != null) {
      return _buildSuccessScreen(colors);
    }

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        title: const Text('Upload Image'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Share your favorite anime and manga reaction panels',
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              // Image picker section
              _buildImagePicker(colors),
              const SizedBox(height: 16),

              // Details section
              _buildDetailsCard(colors),
              const SizedBox(height: 16),

              // Tags section
              _buildTagsCard(colors),
              const SizedBox(height: 16),

              // Error message
              if (_error != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Submit button
              ElevatedButton(
                onPressed: _uploading ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.accentOrange,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _uploading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Text(
                        '📤 Upload Image',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(MyColors colors) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.surfaceContainerHigh),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Image File',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: GestureDetector(
              onTap: _uploading ? null : _pickImage,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors.surfaceContainerHigh,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(24),
                child: _imageFile == null
                    ? Column(
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 48,
                            color: colors.onSurfaceVariant,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Tap to upload',
                            style: TextStyle(
                              color: MyColors.accentOrange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'WEBP, JPEG, PNG, or GIF (max 10 MB)',
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => setState(() => _imageFile = null),
                            child: const Text('Remove Image'),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsCard(MyColors colors) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.surfaceContainerHigh),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Source input
          Text(
            'Source (optional)',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return AnimeSources.search(textEditingValue.text);
            },
            onSelected: (String selection) {
              setState(() => _sourceSlug = selection);
            },
            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
              // Sync our controller with the autocomplete controller
              if (_sourceController.text.isEmpty &&
                  controller.text.isNotEmpty) {
                _sourceController.text = controller.text;
              }

              return TextField(
                controller: controller,
                focusNode: focusNode,
                enabled: !_uploading,
                onChanged: (value) {
                  final transformed = value.toLowerCase().replaceAll(' ', '-');
                  final cursorPosition = controller.selection.baseOffset;
                  controller.value = TextEditingValue(
                    text: transformed,
                    selection: TextSelection.collapsed(offset: cursorPosition),
                  );
                  setState(() => _sourceSlug = transformed);
                },
                decoration: InputDecoration(
                  hintText: 'e.g., attack-on-titan',
                  hintStyle: TextStyle(color: colors.onSurfaceVariant),
                  filled: true,
                  fillColor: colors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: colors.surfaceContainerHigh),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: colors.surfaceContainerHigh),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.accentOrange.withOpacity(0.6)),
                  ),
                ),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: MyColors.darkBlue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colors.surfaceContainerHigh),
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);
                        return InkWell(
                          onTap: () => onSelected(option),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                color: colors.onSurface,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Type selection
          Text(
            'Type',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildTypeOption(
                  '📺',
                  'Anime',
                  'anime_frame',
                  colors,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTypeOption(
                  '📖',
                  'Manga',
                  'manga_panel',
                  colors,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(
    String emoji,
    String label,
    String value,
    MyColors colors,
  ) {
    final isSelected = _type == value;
    return GestureDetector(
      onTap: _uploading ? null : () => setState(() => _type = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? MyColors.accentOrange.withOpacity(0.1)
              : colors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? MyColors.accentOrange
                : colors.surfaceContainerHigh,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? MyColors.accentOrange : colors.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsCard(MyColors colors) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.surfaceContainerHigh),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Tags',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${_selectedTagSlugs.length} selected)',
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TagManager(
            selectedTagSlugs: _selectedTagSlugs.toList(),
            onUpdate: (newTagSlugs) {
              setState(() {
                _selectedTagSlugs.clear();
                _selectedTagSlugs.addAll(newTagSlugs);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessScreen(MyColors colors) {
    return Scaffold(
      backgroundColor: colors.surface,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: MyColors.darkBlue,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.surfaceContainerHigh),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('✓', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 16),
              Text(
                'Upload Successful!',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your image has been uploaded',
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _resetForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.accentOrange,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Upload Another'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Back to Home',
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
