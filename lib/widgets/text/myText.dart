// widgets/text/myText.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyText({super.key, required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: textStyleColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyProfileText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyProfileText({super.key, required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: textStyleColor,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class MyHeadline5Text extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyHeadline5Text({super.key, 
  required this.text,
  this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    TextTheme(headlineMedium: TextStyle(color: color, fontWeight: fontWeight),);
    return Text(
      text,
      style:  Theme.of(context).textTheme.headlineMedium
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyBodyMediumText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const MyBodyMediumText({super.key, 
  required this.text,
  required this.color, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: 
      TextStyle(
        fontFamily: "Arial",
        fontSize: 14,
        fontWeight: fontWeight,
      )
      /* Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: color, fontWeight: fontWeight), */
    );    
  }
}

class MyTitleMediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyTitleMediumText({super.key, 
  required this.text,
  this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(color: color, fontWeight: fontWeight),
        ),
      ),
    );    
  }
}

class MyBodyLargeText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  const MyBodyLargeText({super.key, 
  required this.text, this.size,
  this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: color, fontWeight: fontWeight, fontSize: size,),
    );    
  }
}