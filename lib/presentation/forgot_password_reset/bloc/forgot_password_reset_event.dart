import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordResetEvent extends Equatable {
  const ForgotPasswordResetEvent();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends ForgotPasswordResetEvent {
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

class ConfirmPasswordChanged extends ForgotPasswordResetEvent {
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

class ForgotPasswordResetSubmitted extends ForgotPasswordResetEvent {
  final String username;
  final String otpCode;
  final String password;
  final String confirmPassword;

  const ForgotPasswordResetSubmitted({
    @required this.username,
    @required this.otpCode,
    @required this.password,
    @required this.confirmPassword,
  });

  @override
  List<Object> get props => [username, otpCode, password, confirmPassword];

  @override
  String toString() {
    return 'ForgotPasswordResetSubmitted{username: $username, otpCode: $otpCode, password: $password, confirmPassword: $confirmPassword}';
  }
}
