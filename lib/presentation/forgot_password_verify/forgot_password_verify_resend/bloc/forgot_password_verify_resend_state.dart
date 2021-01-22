import 'package:flutter/cupertino.dart';

class ForgotPasswordVerifyResendState {
  final int time;
  final bool isTimeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isTimeValid && time == 0;

  ForgotPasswordVerifyResendState(
      {@required this.time,
      @required this.isTimeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory ForgotPasswordVerifyResendState.empty() {
    return ForgotPasswordVerifyResendState(
        time: null,
        isTimeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordVerifyResendState.loading() {
    return ForgotPasswordVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordVerifyResendState.failure({String message}) {
    return ForgotPasswordVerifyResendState(
        time: 0,
        isTimeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ForgotPasswordVerifyResendState.success({String message}) {
    return ForgotPasswordVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ForgotPasswordVerifyResendState update({
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

  ForgotPasswordVerifyResendState copyWith({
    @required int time,
    bool isTimeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ForgotPasswordVerifyResendState(
      time: time,
      isTimeValid: isTimeValid ?? this.isTimeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
