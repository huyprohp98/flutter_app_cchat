import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends ForgotPasswordEvent {
  final String username;

  const UsernameChanged({@required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'UsernameChanged{username: $username}';
  }
}


class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  final String username;

  const ForgotPasswordSubmitted({
    @required this.username,
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'ForgotPasswordSubmitted{username: $username}';
  }
}
