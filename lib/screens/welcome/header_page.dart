// screens/welcome/header_page.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/screens/student/student_screen.dart';
//import 'package:ibe_assistance/screens/welcome/pages/object_animation_welcome.dart';

class HeadersPage extends StatelessWidget {
  final String role;

  const HeadersPage({super.key, required this.role});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //body: ObectAnimationWelcome(role: role,),      
      body: StudentScreen(),
    );    
  }
}
