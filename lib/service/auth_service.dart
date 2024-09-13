// service/auth_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ibe_assistance/cubit/user_cubit.dart';
import 'package:ibe_assistance/models/person.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/login_form_provider.dart';
import 'package:http/http.dart' as http;
import 'package:ibe_assistance/screens/goodbye/goodbye.dart';
import 'package:ibe_assistance/service/profile_service.dart';
import 'package:provider/provider.dart';

class AuthService {  
  ProfileService profileService = ProfileService();

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDEAbGaMa-0azRMYcv5zkA3_-Wcb0DuvxE';

  Future<String?> createUser( PersonUser personUser ) async {

    final Map<String, dynamic> authData = {
      'email': personUser.email,
      'password': personUser.dni,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
        log("token recibido ");
        log(decodedResp['idToken']);
        personUser.token = decodedResp['idToken'];
        return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<PersonUser> login(LoginFormProvider loginForm) async{
    
    final Map<String, dynamic> authData = {
      'email': loginForm.email,
      'password': loginForm.dni,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
        String token = decodedResp['idToken'];
        Person person = await profileService.getPerson(loginForm.dni, token);
        return PersonUser.mapToPerson(person, token);
    } else {
      log(decodedResp['error']['message']);
      return  PersonUser(name: "", lastName: "", phone: "", 
               email: "", dni: "", role: "", grade: "", token: "");
    }
  }

  void logout(BuildContext context) {
    context.read<UserCubit>().logout(); 
    Navigator.push(context, MaterialPageRoute(builder: ((context) => const Goodbye())));   
  }
  
}