// service/assistance_service.dart

import 'dart:convert';
import 'dart:developer';

import 'package:ibe_assistance/models/assistance.dart';
import 'package:http/http.dart' as http;
import 'package:ibe_assistance/models/person_user.dart';

class AssistanceService {
  final String _baseUrl = 'ibeassistance-default-rtdb.firebaseio.com';

  Future<String> createAssistance(String qrText, PersonUser personUser) async{   

    if(qrText.contains("ERROR")){
      return "ERROR";      
    }

    Assistance assistance = Assistance(name: personUser.name, lastName: personUser.lastName, dni: personUser.dni, 
      grade: personUser.grade, date: qrText, hour: DateTime.now().hour.toString(), minutes: DateTime.now().minute.toString());
    log("Objeto Assistance mapeado con person y datetime:");
    log("${assistance.name}/${assistance.lastName}/${assistance.dni}/${assistance.grade}/${assistance.date}/${assistance.hour}/${assistance.minutes}");
    
    final url = Uri.https(_baseUrl, '$qrText/${assistance.dni}.json', {
      'auth': personUser.token
    });
    final resp = await http.post(url, body: assistance.toJson());
    final decodedData = json.decode(resp.body);
    log('El decodeData createAssistance recibido es: ');
    
    if(decodedData.containsKey("error")){      
      return "ERROR";
    }else{      
      await updateAssistance(qrText, assistance, personUser);      
      return "OK";
    }
  }

  Future updateAssistance(String qrText, Assistance newAssistance, PersonUser personUser) async{
     final url = Uri.https(_baseUrl, '$qrText/${newAssistance.dni}.json', {
      'auth': personUser.token
    });    
    final resp = await http.put(url, body: newAssistance.toJson());
    final decodedData = resp.body;
    log('El decodeData updateAssistance recibido es: ');
    log(decodedData);    
  }


  
}