import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordVerifyResendEvent extends Equatable {
  const ForgotPasswordVerifyResendEvent();

  @override
  List<Object> get props => [];
}

class TimeInit extends ForgotPasswordVerifyResendEvent {
  final Duration time;

  const TimeInit({@required this.time});

  @override
  List<Object> get props => [time];

  @override
  String toString() {
    return 'TimeInit{time: $time}';
  }
}


class TimeChanged extends ForgotPasswordVerifyResendEvent {
  final int time;

  const TimeChanged({@required this.time});

  @override
  List<Object> get props => [time];

  @override
  String toString() {
    return 'TimeChanged{time: $time}';
  }
}


class ForgotPasswordResendOtp extends ForgotPasswordVerifyResendEvent {
  final String username;

  const ForgotPasswordResendOtp({
    @required this.username,
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'ForgotPasswordResendOtp{username: $username}';
  }
}

