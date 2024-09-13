// screens/register/register_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/models/person.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/person_user_provider.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/screens/welcome/header_page.dart';
import 'package:ibe_assistance/service/auth_service.dart';
import 'package:ibe_assistance/service/profile_service.dart';
import 'package:ibe_assistance/widgets/auth/register/dni_register.dart';
import 'package:ibe_assistance/widgets/auth/register/email_register.dart';
import 'package:ibe_assistance/widgets/auth/register/grade_register.dart';
import 'package:ibe_assistance/widgets/auth/register/lastname_register.dart';
import 'package:ibe_assistance/widgets/auth/register/name_register.dart';
import 'package:ibe_assistance/widgets/auth/register/phone_register.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';
import 'package:ibe_assistance/widgets/ui/auth_background.dart';
import 'package:ibe_assistance/widgets/ui/card_container.dart';

import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(textTitleRegister, style: Theme.of(context).textTheme.headlineMedium,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) {RegisterFormProvider(); PersonUserProvider();},
                      child: const RegisterForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),              
            ],
          ),
        ),
      ),
    );
  }
}

AppBar EmptyAppBar(BuildContext context){
  return AppBar(
    elevation: 10,
    title: const Text(textTitleAppBarRegister),
    actions: <Widget>[      
      const SizedBox(width: textSizeDefaultPaddin / 2),        
      IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: 'Vuelve atrás',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      ),        
    ],
  );
}  

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passVisible = true;

  @override
  Widget build(BuildContext context) {    
    var registerForm = Provider.of<RegisterFormProvider>(context); 
    var personUserProvider = Provider.of<PersonUserProvider>(context);     
    AuthService authService = AuthService();
    ProfileService profileService = ProfileService();

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            NameRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            LastnameRegister(registerForm: registerForm),
            const SizedBox(height: 5),            
            PhoneNumberRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            EmailRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            DniRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            GradeRegister(registerForm: registerForm),
            const SizedBox(height: 25),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themeLoginDisableButton,
              elevation: 0,
              color: themeRegisterButton, 
              onPressed: registerForm.isLoading && registerForm.email.isNotEmpty && registerForm.dni.isNotEmpty
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!registerForm.isValidForm()) return;     
                      print("registerform es");
                      print(registerForm);                      
                      PersonUser personUser = PersonUser.mapToRegisterForm(registerForm);
                      print("La PersonUser mapeada es");
                      print("${personUser.name}/${personUser.lastName}/${personUser.dni}/${personUser.phone!}/${personUser.email}${personUser.grade}/${personUser.role}/${personUser.token}");
                      
                      final String? regisUser = await authService.createUser(personUser);

                      if ( regisUser == null ) {
                        Person person = Person.mapToRegisterForm(registerForm);
                        print("La persona mapeada es");
                        print("${person.name}/${person.lastName}/${person.dni}/${person.phone!}/${person.email}${person.grade}/${person.role}");
                        final String resultRegisterPerson = await profileService.createPerson(person, personUser.token);

                        if(resultRegisterPerson == "OK"){
                          
                          personUserProvider.personUser = personUser;
                          context.read<UserCubit>().createUser(personUser);      
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage(role: person.role,))));                          
                        }else{
                          showDialog(context: context, 
                            builder: (_) => CustomPopup(
                              title: textResultErrorLoginTitle,
                              message: textResultInvalidDataLogin,
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
                        }
                      } else {                        
                        print( regisUser );
                        showDialog(context: context, 
                          builder: (_) => CustomPopup(
                            title: "ERROR REGISTRO DE USUARIO DE AUTH",
                            message: regisUser,
                            buttonAccept: BounceButton(
                              buttonSize: ButtonSize.small,
                              type: ButtonType.secondary,
                              label: "ERROR",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        );      
                      }
                    },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45,
                   vertical: 15),
                  child: Text(
                    registerForm.isLoading ? 'Ingresando': 'Registrarme' ,                     
                    style: const TextStyle(color: themeLoginStateProccess),
                  ))                    
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),      
    );    
  }
}