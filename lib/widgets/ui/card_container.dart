// widgets/ui/card_container.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';


class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: themeCardContainerBoxDecorationCardShape,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: themeCardContainerBoxDecorationBoxShadow,
              blurRadius: 15,
              offset: Offset(
                0,
                5,
              ),
            )
          ]);
}