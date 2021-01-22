import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterVerifyResendEvent extends Equatable {
  const RegisterVerifyResendEvent();

  @override
  List<Object> get props => [];
}

class TimeInit extends RegisterVerifyResendEvent {
  final Duration time;

  const TimeInit({@required this.time});

  @override
  List<Object> get props => [time];

  @override
  String toString() {
    return 'TimeInit{time: $time}';
  }
}


class TimeChanged extends RegisterVerifyResendEvent {
  final int time;

  const TimeChanged({@required this.time});

  @override
  List<Object> get props => [time];

  @override
  String toString() {
    return 'TimeChanged{time: $time}';
  }
}


class RegisterResendOtp extends RegisterVerifyResendEvent {
  final String username;

  const RegisterResendOtp({
    @required this.username,
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'RegisterResendOtp{username: $username}';
  }
}

