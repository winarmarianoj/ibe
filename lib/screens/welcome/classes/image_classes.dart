// screens/welcome/classes/image_classes.dart
import 'package:flutter/material.dart';

class ImageClasses extends StatelessWidget {
  final String image;

  const ImageClasses({super.key, required this.image});

    @override
    Widget build(BuildContext context) {
    return Image.asset(
        image,
        width: 600,
        height: 800,
        fit: BoxFit.cover,
      );
   }
}