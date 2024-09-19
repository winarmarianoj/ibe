// models/assistance.dart
import 'dart:convert';

Assistance assistanceFromJson(String str) => Assistance.fromJson(json.decode(str));

String assistanceToJson(Assistance data) => json.encode(data.toJson());

class Assistance {
    String name;
    String lastName;
    String dni;
    String grade;
    String date;
    String hour;
    String minutes;

    Assistance({
        required this.name,
        required this.lastName,
        required this.dni,
        required this.grade,
        required this.date,
        required this.hour,
        required this.minutes,
    });

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
      "name": name, "lastName": lastName, "dni": dni, "grade": grade,
        "date": date, "hour": hour, "minutes": minutes,
    };
    factory Assistance.fromJson(String str) => Assistance.fromMap(json.decode(str));

    factory Assistance.fromMap(Map<String, dynamic> json) => Assistance(
        name: json["name"],
        lastName: json["lastName"],
        dni: json["dni"],
        grade: json["grade"],
        date: json["date"],
        hour: json["hour"],
        minutes: json["minutes"],
    );
    static Assistance getAssistanceData(Map<String, dynamic> data) {
      return Assistance(
          name: data["name"],
          lastName: data["lastName"],
          dni: data["dni"],
          grade: data["grade"],
          date: data["date"],
          hour: data["hour"],
          minutes: data["minutes"],
      );
    } 

    Map<String, dynamic> map() => {
        "name": name,
        "lastName": lastName,
        "dni": dni,
        "grade": grade,
        "date": date,
        "hour": hour,
        "minutes": minutes,
    };
}