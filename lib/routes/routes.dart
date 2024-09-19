// routes/routes.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibe_assistance/screens/admin/admin_screen.dart';
import 'package:ibe_assistance/screens/profile/profile_person.dart';
import 'package:ibe_assistance/screens/student/student_screen.dart';

final pageRoutesStudent = <_Route>[
  _Route( FontAwesomeIcons.school , 'Asistencia', const StudentScreen()),  
  _Route( FontAwesomeIcons.person , 'Perfil', ProfilePerson() ),
];
final pageRoutesAdmin = <_Route>[
  _Route( FontAwesomeIcons.house , 'Reporte', const AdminScreen() ),
  _Route( FontAwesomeIcons.person , 'Perfil', ProfilePerson() ),
];


class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}