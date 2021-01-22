import 'package:flutter/cupertino.dart';

class ForgotPasswordVerifyState {
  final bool isOtpCodeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isOtpCodeValid;

  ForgotPasswordVerifyState(
      {@required this.isOtpCodeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory ForgotPasswordVerifyState.empty() {
    return ForgotPasswordVerifyState(
        isOtpCodeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordVerifyState.loading() {
    return ForgotPasswordVerifyState(
        isOtpCodeValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordVerifyState.failure({String message}) {
    return ForgotPasswordVerifyState(
        isOtpCodeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ForgotPasswordVerifyState.success({String message}) {
    return ForgotPasswordVerifyState(
        isOtpCodeValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ForgotPasswordVerifyState update({
    bool isOtpCodeValid,
  }) {
    return copyWith(
      isOtpCodeValid: isOtpCodeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordVerifyState copyWith({
    bool isOtpCodeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ForgotPasswordVerifyState(
      isOtpCodeValid: isOtpCodeValid ?? this.isOtpCodeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
