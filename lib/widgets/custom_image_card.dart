import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final Uint8List? imageBytes;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final double elevation;

  const CustomImageCard({
    super.key,
    this.imageBytes,
    this.width = double.infinity,
    this.height = 160,
    this.fit = BoxFit.cover,
    this.borderRadius = 10,
    this.elevation = 5,
  });

  @override
  Widget build(BuildContext context) {
    return imageBytes != null
        ? ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Card(
            elevation: elevation,
            child: Image.memory(
              imageBytes!,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        )
        : const SizedBox.shrink();
  }
}
