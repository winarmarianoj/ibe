// widgets/drawers/draw_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/screens/home/body_drawer_screen.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';

class DrawDrawer extends StatelessWidget {
  const DrawDrawer({super.key, });  

  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {        

        switch ( state.runtimeType ) {
          
          case UserInitial:
            //return const AppIbeAssistance();
            /*loginForm.dni='';loginForm.dnitwo='';loginForm.email='';
            personUserProvider.personUser= new PersonUser(name: '', lastName: '', 
            email: '', dni: '', role: '', grade: '', token: '');
            ChangeNotifierProvider(create: (_) => LoginFormProvider());
            ChangeNotifierProvider(create: (_) => PersonUserProvider());
    
            return LoginScreen();
            */

            //return BodyDrawerScreen(personUser: PersonUser(name: '', lastName: '', 
            //email: '', dni: '', role: '', grade: '', token: ''));

            return Center(child: Text(textNoDataUserInitial));

          case UserActive:
            return BodyDrawerScreen(personUser: (state as UserActive).personUser, );

          default:
            return CustomPopup(
              title: textTitleProfile,
              message: textUnknownState,
              buttonAccept: BounceButton(
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogProfile,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ); 
        }        
    });
  }  
}