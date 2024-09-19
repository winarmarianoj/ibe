// transitions/scale_page.dart

import 'package:flutter/material.dart';

class ScalePage extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;

  ScalePage({required this.builder})
      : super(
          barrierColor: Colors.blueAccent,
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInCubic,
            ),
            child: child,
          ),
        );
}
