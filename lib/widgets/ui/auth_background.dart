// widgets/ui/auth_background.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';


class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(      
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        child: const Icon(
          Icons.person_add,
          color: themePersonAddHeaderIcon,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(top: 95, left: 25, child: _Bubble()),
          Positioned(top: 160, left: 80, child: _Bubble()),
          Positioned(top: 40, left: 90, child: _Bubble()),
          Positioned(top: 70, right: 80, child: _Bubble()),
          Positioned(bottom: 50, left: 10, child: _Bubble()),
          Positioned(bottom: 135, right: 20, child: _Bubble()),
          Positioned(bottom: 90, right: 80, child: _Bubble()),
          Positioned(bottom: 45, right: 140, child: _Bubble()),
          Positioned(bottom: 30, right: 10, child: _Bubble()),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeAuthBackgroundGradiantOne,
            themeAuthBackgroundGradiantTwo,
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
     
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: themeColorDecorationBubble),
    );
  }
}