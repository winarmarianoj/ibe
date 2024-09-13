// cubit/user_cubit.dart
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/service/profile_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  
  UserCubit() : super( UserInitial() );
  ProfileService profileService = ProfileService();
  
  void createUser( PersonUser user ) {
    emit( UserActive(user) );
  }

  void getPerson(){
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith();
      return emit( UserActive( newUser ) );      
    }
  }

  PersonUser? getDataPerson(){
    switch ( state.runtimeType ){
      case UserInitial:
            return PersonUser(name: "", lastName: "", 
            phone: "", email: "", dni: "", role: "", grade: "", token: "",);

      case UserActive:
        return (state as UserActive).personUser;
      
      default: 
        return null;
    }    
  }

  void changeName( String name, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( name: name );
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }
  void changeLastName( String lastName, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( lastName: lastName );
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }
  void changePhone( String phone, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( phone: phone );
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }
  void changeEmail( String email, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( email: email );
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }

  void changeDni(String dni, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( dni: dni);
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }

  void changeGrade(String grade, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.personUser.copyWith( grade: grade);
      profileService.updatePerson(newUser);
      emit( UserActive( newUser ) );
    }
  }

  void deleteUser(BuildContext context) { 
    final currentState = state;
    if ( currentState is UserActive ) {      
      final newUser = currentState.personUser.copyWith();
      log("estoy en userCubit delete y el user id es ${newUser.dni}");
      profileService.deletePerson(newUser);
    }    
  }

  void logout() {
    emit(UserInitial());
  }

}
