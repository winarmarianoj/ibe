// screens/student/bodies/body_student_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/user_provider.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';
import 'package:provider/provider.dart';

class BodyStudentScreen extends StatefulWidget{
  const BodyStudentScreen({super.key,});  
  @override
  State<BodyStudentScreen> createState() => _BodyStudentScreenState();
}

class _BodyStudentScreenState extends State<BodyStudentScreen> {
  @override
  Widget build(BuildContext context) {
    var userForm = Provider.of<UserFormProvider>(context);
    userForm.personUser.setIsStudentHome = true;
        
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: MyBodyLargeText(
              text: textTitleQrScanner,
              color: themeWindowText, // appTheme.currentTheme.hintColor,
              fontWeight: FontWeight.bold,
              size: 24,
            ),
          ),
        ), 
        SizedBox(height: 5),               
      ],
    );
  }
}