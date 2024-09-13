// screens/student/bodies/body_student_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';
import 'package:provider/provider.dart';

class BodyStudentScreen extends StatefulWidget{
  final PersonUser personUser;
  const BodyStudentScreen({super.key, required this.personUser});  

  @override
  State<BodyStudentScreen> createState() => _BodyStudentScreenState(personUser: personUser);
}

class _BodyStudentScreenState extends State<BodyStudentScreen> {
  final PersonUser personUser;

  _BodyStudentScreenState({required this.personUser});

  @override
  Widget build(BuildContext context) {    
    widget.personUser.setIsStudentHome = true;
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: MyBodyLargeText(
              text: textTitleQrScanner,
              color: appTheme.currentTheme.hintColor,
              fontWeight: FontWeight.bold,
              size: 20,
            ),
          ),
        ), 
        const SizedBox(height: 5),               
      ],
    );
  }
}