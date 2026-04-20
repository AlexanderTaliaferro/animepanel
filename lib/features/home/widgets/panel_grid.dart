import 'package:flutter/material.dart';
import '../../../core/models/panel_image.dart';
import '../../../shared/widgets/panel_card.dart';

class PanelGrid extends StatelessWidget {
  final List<PanelImage> images;
  final void Function(PanelImage) onTap;

  const PanelGrid({super.key, required this.images, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) => PanelCard(
        image: images[index],
        onTap: () => onTap(images[index]),
      ),
    );
  }
}
