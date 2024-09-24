// screens/profile/input/input_text.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/drawers/draw_drawer.dart';
import 'package:ibe_assistance/widgets/drawers/profile_drawer.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';

class InputText extends StatelessWidget {
  final String attribute;
  const InputText({super.key, required this.attribute});

  @override
  Widget build(BuildContext context) {
    String data = '';
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: const DrawDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  "$textWriterNewChangeByVariable$attribute :",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
                    child: Column(                    
                      children: [                      
                        TextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) => data = value,
                        ), 
                        const SizedBox(height: 20),
                        BounceButton(
                          buttonSize: ButtonSize.small, 
                          type: ButtonType.primary, 
                          label: textSendDataButton,
                          iconLeft: Icons.send,
                          textColor: buttonInputText,
                          horizontalPadding: true,
                          contentBasedWidth: true,
                          onPressed:() {
                            changeNewAttribute(attribute, data, context);
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => const ProfileDrawer())));
                          },
                        ),               
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );  
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileDrawer(),
              ),
            );
          },
        ),        
      ],
    );
  }  
}

void changeNewAttribute(String attribute, String newAttribute, BuildContext context){
  switch(attribute){
      case 'Nombre':
      context.read<UserCubit>().changeName(newAttribute, context);
      break;
      case 'Apellido':
      context.read<UserCubit>().changeLastName(newAttribute, context);
      break;      
      case 'Telefono':
      context.read<UserCubit>().changePhone(newAttribute, context);
      break;
      case 'Email': 
      context.read<UserCubit>().changeEmail(newAttribute, context);
      break;
      case 'Dni':
      context.read<UserCubit>().changeDni(newAttribute, context);
      break;
      case 'Curso':
      context.read<UserCubit>().changeGrade(newAttribute, context);
      break;
      
      default:
      print(textTypeChangeNotExists);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textTitleResultChangeNotExists,
            message: textTypeChangeNotExists,
            buttonAccept: BounceButton(
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ); 
      break;
  }

}