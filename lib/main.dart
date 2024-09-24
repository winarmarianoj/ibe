// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:ibe_assistance/providers/user_provider.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/theme/menuTheme.dart';
import 'package:provider/provider.dart';

void main() async {
 runApp(const AppIbeAssistance());
}
  
class AppIbeAssistance extends StatelessWidget {
  const AppIbeAssistance({super.key});

@override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
        ChangeNotifierProvider(create: (_) => RegisterFormProvider()),        
        ChangeNotifierProvider(create: (_) => ThemeChanger(6)),        
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
  } 
}
