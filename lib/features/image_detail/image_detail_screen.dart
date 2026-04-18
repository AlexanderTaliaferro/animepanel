import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../core/models/panel_image.dart';
import '../../core/api/anime_panel_api.dart';
import '../../theme/my_colors.dart';

class ImageDetailScreen extends ConsumerStatefulWidget {
  final PanelImage image;

  const ImageDetailScreen({super.key, required this.image});

  @override
  ConsumerState<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends ConsumerState<ImageDetailScreen> {
  bool _copied = false;
  bool _sharing = false;
  late PanelImage _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  Future<void> _handleCopy() async {
    try {
      final bytes =
          await AnimePanelApi.instance.downloadImageBytes(_image.imageUrl);

      // Write image bytes to clipboard
      final item = DataWriterItem();
      item.add(Formats.png(bytes));
      await SystemClipboard.instance?.write([item]);

      // Track copy
      await AnimePanelApi.instance.recordCopy(_image.id);

      setState(() => _copied = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _copied = false);
    } catch (e) {
      // Show error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to copy image')),
        );
      }
    }
  }

  Future<void> _handleShare() async {
    setState(() => _sharing = true);
    try {
      final bytes =
          await AnimePanelApi.instance.downloadImageBytes(_image.imageUrl);

      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/panel_${_image.id}.png');
      await file.writeAsBytes(bytes);

      // Get the share button position for iPad popover
      final box = context.findRenderObject() as RenderBox?;
      final sharePositionOrigin = box != null
          ? box.localToGlobal(Offset.zero) & box.size
          : null;

      // Share using native share sheet
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'From ${_image.sourceTitle}',
        sharePositionOrigin: sharePositionOrigin,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to share image')),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.displayColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          _image.sourceTitle,
          style: TextStyle(color: colors.displayColor, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: MyColors.accentOrange.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: CachedNetworkImage(
                      imageUrl: _image.imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      placeholder: (_, __) => Container(
                        height: 400,
                        color: MyColors.darkBlue,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: MyColors.accentOrange,
                          ),
                        ),
                      ),
                      errorWidget: (_, __, ___) => Container(
                        height: 400,
                        color: MyColors.darkBlue,
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: MyColors.accentOrange.withOpacity(0.5),
                          size: 64,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Copy button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _handleCopy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _copied ? Colors.green : MyColors.accentOrange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(_copied ? Icons.check_circle : Icons.copy,
                        size: 20),
                    label: Text(
                      _copied ? 'Copied to clipboard!' : 'Copy Image',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Source
                _buildSection(
                  context,
                  'Source',
                  Text(
                    _image.sourceTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colors.displayColor,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tags
                if (_image.tags.isNotEmpty) ...[
                  _buildSection(
                    context,
                    'Tags',
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _image.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.darkBlue,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: MyColors.accentOrange.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 13,
                              color: colors.displayColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                // Share button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _sharing ? null : _handleShare,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: MyColors.accentOrange,
                      side: BorderSide(
                          color: MyColors.accentOrange.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: _sharing
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: MyColors.accentOrange,
                            ),
                          )
                        : const Icon(Icons.share, size: 20),
                    label: Text(
                      _sharing ? 'Preparing...' : 'Share Image',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    final colors = MyColors(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: colors.onSurfaceVariant,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}
