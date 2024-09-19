// models/person_user.dart

import 'dart:convert';

import 'package:ibe_assistance/models/person.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';

class PersonUser {  
  String name, lastName, email, dni, role, grade, token; 
  String? phone;
  
  PersonUser({ required this.name, required this.lastName,
  this.phone, required this.email, required this.dni, required this.role, 
  required this.grade, required this.token});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
      "name": name, "lastName": lastName, "phone": phone, "token": token,
      "email": email, "dni": dni, "role": role, "grade": grade,
    };

  PersonUser copyWith({ 
    String? name, lastName, phone, email, dni, role, grade, token,
  }) =>
    PersonUser(    
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    dni: dni ?? this.dni,
    role: role ?? this.role,
    grade: grade ?? this.grade,
    token: token ?? this.token,
  );

  factory PersonUser.fromJson(Map<String, dynamic> jsonData) {    
    return PersonUser(name: jsonData['name'], lastName: jsonData['lastName'], 
    phone: jsonData['phone'], email: jsonData['email'], dni: jsonData['dni'], 
    role: jsonData['role'], grade: jsonData['grade'], token: jsonData['token']);
  } 

  bool _isStudentHome = false;
  bool get isStudentHome => _isStudentHome;

  set setIsStudentHome(bool value) {
    _isStudentHome = value;
  }

  bool _isAdminHome = false;
  bool get isAdminHome => _isAdminHome;

  set setIsAdminHome(bool value) {
    _isAdminHome = value;
  }

    Map<String, dynamic> toFirestore() {
    return {      
      "name": name,
      "lastName": lastName,
      if (phone != null) "phone": phone,
      "email": email,
      "dni": dni,
      "role": role,
      "grade": grade, 
      "token": token,     
    };
  }

  static PersonUser getConsumerData(Map<String, dynamic> data) {
    return PersonUser(      
      name: data['name'],
      lastName: data['lastName'],
      phone: data['phone'],
      email: data['email'],
      dni: data['dni'],
      role: data['role'],
      grade: data['grade'],
      token: data['token'],
    );
  }

  static PersonUser mapToPerson(Person person, String decodedResp) {
    return PersonUser(name: person.name, lastName: person.lastName, 
    phone: person.phone, email: person.email, dni: person.dni, 
    role: person.role, grade: person.grade, token: decodedResp);
  }

  static PersonUser mapToRegisterForm(RegisterFormProvider registerForm) {
    return PersonUser(name: registerForm.name, lastName: registerForm.lastName, 
    phone: registerForm.phone, email: registerForm.email, dni: registerForm.dni, 
    role: 'STUDENT', grade: registerForm.grade, token: "");
  } 

}


