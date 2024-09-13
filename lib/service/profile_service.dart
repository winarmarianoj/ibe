// service/profile_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:ibe_assistance/models/person.dart';
import 'package:http/http.dart' as http;
import 'package:ibe_assistance/models/person_user.dart';

class ProfileService {
  final String _baseUrl = 'ibeassistance-default-rtdb.firebaseio.com';    

  Future<Person> getPerson(String personDni, String token) async{
    
    final url = Uri.https(_baseUrl, 'persons/$personDni.json', {
          'auth': token
        });
    final resp = await http.get(url);
    final Map<String, dynamic> personMap = json.decode(resp.body);
    log("El mapa de la persona que obtiene ");
    print(personMap);

    Person person = Person(name: "", lastName: "", 
        phone: "", email: "", dni: "", role: "", grade: "");
    person = Person.fromJson(personMap);

    log("ESTOY EN LOGIN, Y LA PERSONA SELECCIONADA ES");
    log("${person.name}/${person.lastName}/${person.dni}/${person.phone!}/${person.email}${person.grade}/${person.role}");
    return person;
  }

  Future<String> createPerson(Person person, String token) async{
    final url = Uri.https(_baseUrl, 'persons/${person.dni}.json', {
      'auth': token
    });
    final resp = await http.post(url, body: person.toJson());
    json.decode(resp.body);
    await updatePersonPostCreated(person, token);    
    return "OK";
  }

  Future updatePersonPostCreated(Person person, String token) async{    
     final url = Uri.https(_baseUrl, 'persons/${person.dni}.json', {
      'auth': token
    });
    log("${person.name}/${person.lastName}/${person.dni}/${person.phone!}/${person.email}${person.grade}/${person.role}");
    final resp = await http.put(url, body: person.toJson());
    final decodedData = resp.body;
    log('El decodeData updatePerson recibido es: ');
    log(decodedData);
  }


  Future<Person> updatePerson(PersonUser personUser) async{
    Person person = Person.toMapPersonUser(personUser);
     final url = Uri.https(_baseUrl, 'persons/${person.dni}.json', {
      'auth': personUser.token
    });
    log("${person.name}/${person.lastName}/${person.dni}/${person.phone!}/${person.email}${person.grade}/${person.role}");
    final resp = await http.put(url, body: person.toJson());
    final decodedData = resp.body;
    log('El decodeData updatePerson recibido es: ');
    log(decodedData);
    return person;
  }

  void deletePerson(PersonUser personUser) async{
    Person person = Person.toMapPersonUser(personUser);
    final url = Uri.https(_baseUrl, 'persons/${person.dni}.json', {
      'auth': personUser.token
    });
    log("${person.name}/${person.lastName}/${person.dni}/${person.phone!}/${person.email}${person.grade}/${person.role}");
    final resp = await http.delete(url, body: person.toJson());
    final decodedData = resp.body;
    log('El decodeData updatePerson recibido es: ');
    log(decodedData);
  }
}