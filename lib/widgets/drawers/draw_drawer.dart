// widgets/drawers/draw_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:ibe_assistance/providers/login_form_provider.dart';
import 'package:ibe_assistance/providers/person_user_provider.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/screens/home/body_drawer_screen.dart';
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/theme/menuTheme.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';
import 'package:provider/provider.dart';


class DrawDrawer extends StatelessWidget {
  const DrawDrawer({super.key, });  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {        

        switch ( state.runtimeType ) {
          
          case UserInitial:
            return MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
                      ChangeNotifierProvider(create: (_) => RegisterFormProvider()),        
                      ChangeNotifierProvider(create: (_) => ThemeChanger(6)),
                      ChangeNotifierProvider(create: (_) => PersonUserProvider()),
                      ChangeNotifierProvider(create: (_) => AssistanceFormProvider()),
                      BlocProvider(create: ( _ ) => UserCubit() ),
                    ],
                    child: Builder(
                      builder: (context) {
                        final appTheme = Provider.of<ThemeChanger>(context);
                        return MaterialApp(            
                          debugShowCheckedModeBanner: false,
                          title: textTitleWebSite,            
                          home: LoginScreen(),
                          theme: appTheme.darkTheme ? themeDarkTwo : themeLightTwo, 
                        );
                      }
                    ),     
                  );     

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