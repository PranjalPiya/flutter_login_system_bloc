import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_system_bloc/main.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TokenCheckEvent extends LoginEvent {}

//When User pressed the button
class LoginButtonPressedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressedEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutButtonPressedEvent extends LoginEvent {}
