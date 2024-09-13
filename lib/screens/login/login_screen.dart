// screens/login/login_screen.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/login_form_provider.dart';
import 'package:ibe_assistance/providers/person_user_provider.dart';
import 'package:ibe_assistance/screens/register/register_screen.dart';
import 'package:ibe_assistance/screens/welcome/header_page.dart';
import 'package:ibe_assistance/service/auth_service.dart';
import 'package:ibe_assistance/widgets/auth/login/dni_login_widget.dart';
import 'package:ibe_assistance/widgets/auth/login/email_login_widget.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';
import 'package:ibe_assistance/widgets/ui/auth_background.dart';
import 'package:ibe_assistance/widgets/ui/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(textTitle, style: Theme.of(context).textTheme.headlineMedium,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) { LoginFormProvider(); PersonUserProvider();},
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(textNewAccount, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 10),              
              BounceButton(
                buttonSize: ButtonSize.medium, 
                type: ButtonType.primary, 
                label: textNewAccount,
                iconLeft: Icons.save_alt_sharp,
                textColor: const Color.fromARGB(255, 7, 59, 230),
                horizontalPadding: true,
                contentBasedWidth: true,
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const RegisterScreen())));
                },
              ),  
              const SizedBox(height: 50),
              /*const Text(textChangePassword, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 40),
              
              BounceButton(
                buttonSize: ButtonSize.small, 
                type: ButtonType.subscriptos, 
                label: textRestorePassword,
                iconLeft: Icons.password,
                textColor: buttonChangeProfile,
                horizontalPadding: true,
                contentBasedWidth: true,
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const ForgotScreen())));
                },
              ),  
              const SizedBox(height: 50),
              */
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {
    var loginForm = Provider.of<LoginFormProvider>(context);
    var personUserProvider = Provider.of<PersonUserProvider>(context);
    AuthService service = AuthService();

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            EmailLoginWidget(loginForm: loginForm),
            const SizedBox(height: 30),
            //_buildPassword(loginForm),
            DniLoginWidget(loginForm: loginForm),
            const SizedBox(height: 30),
            //PressButtonLoginWidget(context: context, loginForm: loginForm,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themeLoginDisableButton,
              elevation: 0,
              color: themeLoginSendButton,
              
              onPressed: loginForm.isLoading && loginForm.email.isNotEmpty && loginForm.dni.isNotEmpty
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginForm.isValidForm()) return;              
                      final PersonUser personUser = await service.login(loginForm);
                      if(personUser.name.length>2){
                        personUserProvider.personUser = personUser;
                        context.read<UserCubit>().createUser(personUser);      
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage(role: personUser.role,))));
                      }else {
                        print("No such document.");
                        log(logLoginFailedAuthenticationService);
                        showDialog(
                          context: context, 
                          builder: (_) => CustomPopup(
                              title: textResultErrorLoginTitle,
                              message: textResultInvalidDataLogin,
                              buttonAccept: BounceButton(
                                iconLeft: Icons.error,
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
                  },

              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Ingresando': 'Ingresar' ,                     
                  style: const TextStyle(color: themeLoginStateProccess, fontSize: 12.00),
              ))                     
            ),
          ],
        ),
      ),      
    );    
  }

}





