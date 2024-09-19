// widgets/itemCardWidgetText/item_card_text_widget.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';

class ItemCardTextWidget extends StatelessWidget {
  final String? text;
  final String? label;
  final FontWeight? fontWeight;
  final Color? color;
  final double? size;

  const ItemCardTextWidget({
    super.key,
    required this.text, required this.label,
    this.fontWeight, this.color, this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MyBodyLargeText(text: label! + text!, size: size,
        color: color, fontWeight: fontWeight,)
      ),
    );
  }
}