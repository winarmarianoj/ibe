// screens/goodbye/goodbye.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/screens/goodbye/pages/object_animation_goodbye.dart';

class Goodbye extends StatelessWidget {
  const Goodbye({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ObjectAnimationGoodbye(),
    );
  }
}