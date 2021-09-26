import 'package:equatable/equatable.dart';
import 'package:flutter_login_system_bloc/Api/profile_jsonToDart.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends LoginState {}

//unauthenticated(shows login_page)
class LoggedInState extends LoginState {
  final User? userProfile;
  LoggedInState({required this.userProfile});

  @override
  List<Object?> get props => [userProfile];
}

//if login is failed
class LoginFailedState extends LoginState {
  final String? message;
  LoginFailedState({this.message});
  @override
  List<Object?> get props => [message];
}

//
class LoggedoutState extends LoginState {}




//for profile page
// class ProfilePageState extends LoginState {}
