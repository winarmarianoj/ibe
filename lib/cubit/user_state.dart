// cubit/user_state.dart
part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final isExistsUser = false;
}

class UserActive extends UserState {
  final isExistsUser = true;
  final PersonUser personUser;

  UserActive(this.personUser);
}

