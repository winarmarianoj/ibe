// models/person.dart

import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'dart:convert';

class Person {  
  String name, lastName, email, dni, role, grade; 
  String? phone;
  
  Person({ required this.name, required this.lastName,
  this.phone, required this.email, required this.dni, required this.role, 
  required this.grade});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
      "name": name, "lastName": lastName, "phone": phone,
      "email": email, "dni": dni, "role": role, "grade": grade,
    };

  Person copyWith({ 
    String? name, lastName, phone, email, dni, role, grade, token,
  }) =>
    Person(    
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    dni: dni ?? this.dni,
    role: role ?? this.role,
    grade: grade ?? this.grade,
  );

  factory Person.fromJson(Map<String, dynamic> jsonData) {    
    return Person(name: jsonData['name'], lastName: jsonData['lastName'], 
    phone: jsonData['phone'], email: jsonData['email'], dni: jsonData['dni'], 
    role: jsonData['role'], grade: jsonData['grade']);
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
    };
  }

  static Person mapToRegisterForm(RegisterFormProvider register) {    
    return Person(name: register.name, lastName: register.lastName, 
    phone: register.phone, email: register.email, dni: register.dni, 
    role: 'STUDENT', grade: register.grade);
  }

  static Person getPersonFromGetData(Map<String, dynamic> data) {
    return Person(      
      name: data['name'],
      lastName: data['lastName'],
      phone: data['phone'],
      email: data['email'],
      dni: data['dni'],
      role: data['role'],
      grade: data['grade'],
    );
  }

  static Person toMapPersonUser(PersonUser personUser) {
    return Person(name: personUser.name, lastName: personUser.lastName, 
    phone: personUser.phone, email: personUser.email, dni: personUser.dni, 
    role: personUser.role, grade: personUser.grade);
  } 

}

