import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordVerifyEvent extends Equatable {
  const ForgotPasswordVerifyEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends ForgotPasswordVerifyEvent {
  final String username;

  const UsernameChanged({@required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'UsernameChanged{username: $username}';
  }
}

class OtpCodeChanged extends ForgotPasswordVerifyEvent {
  final String otpCode;

  OtpCodeChanged({@required this.otpCode});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'OtpCodeChanged{otpCode: $otpCode}';
  }
}

class ForgotPasswordVerifySubmitted extends ForgotPasswordVerifyEvent {
  final String username;
  final String otpCode;

  const ForgotPasswordVerifySubmitted({
    @required this.username,
    @required this.otpCode,
  });

  @override
  List<Object> get props => [username, otpCode];

  @override
  String toString() {
    return 'ForgotPasswordVerifySubmitted{username: $username, password: $otpCode}';
  }
}

class ResendOtp extends ForgotPasswordVerifyEvent {
  const ResendOtp();

  @override
  List<Object> get props => [];
}
