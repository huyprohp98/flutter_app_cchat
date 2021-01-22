import 'package:flutter/cupertino.dart';

class RegisterVerifyState {
  final bool isOtpCodeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isOtpCodeValid;

  RegisterVerifyState(
      {@required this.isOtpCodeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory RegisterVerifyState.empty() {
    return RegisterVerifyState(
        isOtpCodeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterVerifyState.loading() {
    return RegisterVerifyState(
        isOtpCodeValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterVerifyState.failure({String message}) {
    return RegisterVerifyState(
        isOtpCodeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory RegisterVerifyState.success({String message}) {
    return RegisterVerifyState(
        isOtpCodeValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  RegisterVerifyState update({
    bool isOtpCodeValid,
  }) {
    return copyWith(
      isOtpCodeValid: isOtpCodeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterVerifyState copyWith({
    bool isOtpCodeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterVerifyState(
      isOtpCodeValid: isOtpCodeValid ?? this.isOtpCodeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
