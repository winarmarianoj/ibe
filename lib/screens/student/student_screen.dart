// screens/student/student_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/screens/student/bodies/body_student_screen.dart';
import 'package:ibe_assistance/widgets/button/scan_button.dart';
import 'package:ibe_assistance/widgets/drawers/draw_drawer.dart';


class StudentScreen extends StatefulWidget{
  const StudentScreen({super.key});
   
  
  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer:  const DrawDrawer(),
      body:  const BodyStudentScreen(),        
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: const Text(textTitleAppBarByApplicant),
      actions: const <Widget>[
        SizedBox(width: textSizeDefaultPaddin / 2),        
      ],
    );
  }  
}