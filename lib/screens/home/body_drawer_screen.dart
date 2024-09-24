// screens/home/body_drawer_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/widgets/routes/option_routes_admin.dart';
import 'package:ibe_assistance/widgets/routes/option_routes_student.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';

import 'package:provider/provider.dart';

class BodyDrawerScreen extends StatelessWidget{
  final PersonUser personUser;
  final transitionDuration = const Duration(milliseconds: 250);

  const BodyDrawerScreen({super.key, required this.personUser});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.hintColor;
        
    return Drawer( 
      backgroundColor: const Color.fromARGB(255, 112, 128, 45),
      width: 280,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 2.0),
              child: SafeArea(     
                child: SizedBox(             
                  width: 100,
                  height: 90,
                  child: CircleAvatar(
                    //backgroundColor: Colors.deepOrangeAccent, // accentColor,
                    //child: Text(textInitialsWebSiteName, style: TextStyle( fontSize: 30, color: Colors.black),),
                    backgroundImage: AssetImage('assets/icon/logoRDR.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            MyBodyMediumText(
              text: "$textWelcome ${personUser.name} ${personUser.lastName}",
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: "$textWebSite $textWebSiteName",
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textTypeVehiclesWebSite,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: "$textContactTitle $textContactPhone",
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),   
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textContactEmail,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 7),

            if(personUser.role == "STUDENT") const OptionRoutesApplicant(),
            if(personUser.role == "ADMIN") const OptionRoutesAdmin(),            
            const SizedBox(height: 3),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: accentColor ),
              title: const Text(textDarkModeTheme),
              trailing: 
              Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.darkTheme = value
              ),
            ),            
            ListTile(
              leading: Icon(Icons.logout, color: accentColor ),
              title: const Text(textLogout),
              onTap: () {                
                context.read<UserCubit>().logout();
                //Future.delayed(const Duration(seconds: 3));
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }
            ),
          ],
      ),
    );
  }
  
  BoxDecoration colorsShopOfVehicles() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 240, 163, 63), 
        Color.fromARGB(255, 235, 137, 9), 
      ])
  );

}
