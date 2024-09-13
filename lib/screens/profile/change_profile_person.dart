// screens/profile/change_profile_person.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/screens/profile/input/input_text.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/drawers/body_profile_drawer.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';

class ChangeProfilePerson extends StatelessWidget {
  const ChangeProfilePerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textTitleChangeProfile, ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Nombre"))));
              },
            ),                        
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeLastName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Apellido"))));
              },
            ),     
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(              
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeDni,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Dni"))));
              },
            ),                      
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangePhone,
              iconLeft: Icons.phone,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Telefono"))));
              },
            ),                        
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeEmail,
              iconLeft: Icons.email,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Email"))));
              },
            ),  
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeGrade,
              iconLeft: Icons.password,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const InputText(attribute: "Curso"))));
              },
            ),
                                       
            const SizedBox(height: textSizeDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonDeleteUser,
              iconLeft: Icons.delete,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {       
                showDialog(context: context, 
                builder: (context) => AlertDialog(
                    title: const MyText(text: "Elimina Perfil"),
                    content: const MyText(text: "Esta seguro que desea eliminarse del IBE-RDR?"),
                    actions: [
                      TextButton(onPressed:() {context.read<UserCubit>().deleteUser(context);}, child: const MyText(text: "SI",)),
                      TextButton(onPressed:() 
                      {Navigator.push(context, MaterialPageRoute(builder: ((context) => const BodyProfileDrawer())));},
                      child: const MyText(text: "NO",)),
                    ],
                  ),
                );
              }
            ),                        
          ],
        ),
      )
      ),
    );
  }
}