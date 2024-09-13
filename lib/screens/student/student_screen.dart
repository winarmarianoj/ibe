// screens/student/student_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/widgets/button/scan_button.dart';
import 'package:ibe_assistance/widgets/drawers/body_student_drawer.dart';
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
      body:  const BodyStudentDrawer(),        
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: const Text(textTitleAppBarByApplicant),
      actions: <Widget>[
        const SizedBox(width: textSizeDefaultPaddin / 2),        
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: textToolTipSearch,
          onPressed: () {
           /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );*/
          },
        ),
      ],
    );
  }  
}