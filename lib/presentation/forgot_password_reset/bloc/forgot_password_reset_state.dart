import 'package:flutter/cupertino.dart';

class ForgotPasswordResetState {
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isPasswordValid && isConfirmPasswordValid;

  ForgotPasswordResetState(
      {@required this.isPasswordValid,
      @required this.isConfirmPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory ForgotPasswordResetState.empty() {
    return ForgotPasswordResetState(
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordResetState.loading() {
    return ForgotPasswordResetState(
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordResetState.failure({String message}) {
    return ForgotPasswordResetState(
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ForgotPasswordResetState.success({String message}) {
    return ForgotPasswordResetState(
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ForgotPasswordResetState update(
      {bool isPasswordValid, bool isConfirmPasswordValid}) {
    return copyWith(
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordResetState copyWith({
    bool isPasswordValid,
    bool isConfirmPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ForgotPasswordResetState(
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
