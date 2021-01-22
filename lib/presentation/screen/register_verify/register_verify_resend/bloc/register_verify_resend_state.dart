import 'package:flutter/cupertino.dart';

class RegisterVerifyResendState {
  final int time;
  final bool isTimeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isTimeValid && time == 0;

  RegisterVerifyResendState(
      {@required this.time,
      @required this.isTimeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory RegisterVerifyResendState.empty() {
    return RegisterVerifyResendState(
        time: null,
        isTimeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterVerifyResendState.loading() {
    return RegisterVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterVerifyResendState.failure({String message}) {
    return RegisterVerifyResendState(
        time: 0,
        isTimeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory RegisterVerifyResendState.success({String message}) {
    return RegisterVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  RegisterVerifyResendState update({
    @required int time,
    bool isTimeValid,
  }) {
    return copyWith(
      time: time,
      isTimeValid: isTimeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterVerifyResendState copyWith({
    @required int time,
    bool isTimeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterVerifyResendState(
      time: time,
      isTimeValid: isTimeValid ?? this.isTimeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
