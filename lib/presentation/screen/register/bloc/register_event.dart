import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends RegisterEvent {
  final String username;

  const UsernameChanged({@required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'UsernameChanged{email: $username}';
  }
}

class PasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  PasswordChanged({@required this.password, @required this.confirmPassword});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  ConfirmPasswordChanged(
      {@required this.password, @required this.confirmPassword});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ConfirmPasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}



class RegisterSubmitted extends RegisterEvent {
  final String username;
  final String password;
  final String confirmPassword;

  const RegisterSubmitted({
    @required this.username,
    @required this.password,
    @required this.confirmPassword,

  });

  @override
  List<Object> get props => [username, password, confirmPassword];

  @override
  String toString() {
    return 'Submitted{email: $username, password: $password, confirmPassword: $confirmPassword, }';
  }
}