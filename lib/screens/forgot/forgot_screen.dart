// screens/forgot/forgot_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/login_form_provider.dart';
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/widgets/auth/login/dni_login_widget.dart';
import 'package:ibe_assistance/widgets/auth/login/dni_two_login_widget.dart';
import 'package:ibe_assistance/widgets/auth/login/email_login_widget.dart';
import 'package:ibe_assistance/widgets/ui/auth_background.dart';
import 'package:ibe_assistance/widgets/ui/card_container.dart';

import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotState();
}

class _ForgotState extends State<ForgotScreen> {
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
                    Text(textTitleForgot, style: Theme.of(context).textTheme.headlineMedium,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const ForgotForm(),
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
    title: const Text(textTitleAppBarDniChange),
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

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});
  
  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {    
    var forgotForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: forgotForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            EmailLoginWidget(loginForm: forgotForm),
            const SizedBox(height: 30),
            //_buildPasswordOne(forgotForm),
            DniLoginWidget(loginForm: forgotForm),
            const SizedBox(height: 30),
            //_buildPasswordTwo(forgotForm),
            DniTwoLoginWidget(loginForm: forgotForm),
            const SizedBox(height: 30),
            //PressButtonForgotWidget(context: context, forgotForm: forgotForm),
          ],
        ),
      ),      
    );    
  }

}
