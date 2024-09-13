// screens/profile/profile_person.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/screens/profile/change_profile_person.dart';
import 'package:ibe_assistance/widgets/drawers/draw_drawer.dart';

class ProfilePerson extends StatelessWidget {
  final PersonUser personUser;
  const ProfilePerson(this.personUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 10,
      ),
      drawer: const DrawDrawer(),
      body: SingleChildScrollView(
        child: PersonData(personUser),
      ),  
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const ChangeProfilePerson())))
      ),
   );
  }
}


class PersonData extends StatelessWidget {
  final PersonUser personUser;
  const PersonData( this.personUser, {super.key} );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              const Text("Datos de su perfil", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
              const Divider(),              
              ListTile( title: Text('Nombre: ${ personUser.name }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Apellido: ${ personUser.lastName }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Dni: ${ personUser.dni }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Teléfono: ${ personUser.phone }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Email: ${ personUser.email }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),              
              ListTile( title: Text('Año: ${ personUser.grade }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
            ],
          ),
    );
  }

}