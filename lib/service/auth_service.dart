// service/auth_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ibe_assistance/models/person.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:ibe_assistance/screens/login/login_screen.dart';
import 'package:ibe_assistance/service/profile_service.dart';

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

  Future<UserFormProvider> login(UserFormProvider userFormProvider) async{
    
    final Map<String, dynamic> authData = {
      'email': userFormProvider.email,
      'password': userFormProvider.dni,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
        String token = decodedResp['idToken'];
        Person person = await profileService.getPerson(userFormProvider.dni, token);
        PersonUser personUser = PersonUser.mapToPerson(person, token);
        log("ESTOY EN LOGIN, Y LA PERSONA SELECCIONADA ES");
        log("${personUser.name}/${personUser.lastName}/${personUser.dni}/${personUser.phone!}/${personUser.email}/${personUser.grade}/${personUser.role}/${personUser.token}");
    
        userFormProvider.personUser = personUser;
        userFormProvider.isLoading = true;
        return userFormProvider;
    } else {
      log(decodedResp['error']['message']);
      userFormProvider.personUser = PersonUser(name: "", lastName: "", phone: "", 
               email: "", dni: "", role: "", grade: "", token: "");
      return userFormProvider;
    }
  }

  void logout(BuildContext context) {        
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: ((context) => LoginScreen()),),);
  }
  
}