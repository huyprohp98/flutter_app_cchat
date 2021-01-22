import 'package:flutter/cupertino.dart';

class RegisterState {
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid =>
      isUsernameValid && isPasswordValid && isConfirmPasswordValid  ;

  RegisterState(
      {@required this.isUsernameValid,
        @required this.isPasswordValid,
        @required this.isConfirmPasswordValid,
        @required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message});

  factory RegisterState.empty() {
    return RegisterState(
        isUsernameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterState.loading() {
    return RegisterState(
        isUsernameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterState.failure({String message}) {
    return RegisterState(
        isUsernameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory RegisterState.success({String message}) {
    return RegisterState(
        isUsernameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  RegisterState update(
      {bool isUsernameValid,
        bool isPasswordValid,
        bool isConfirmPasswordValid,
        String message}) {
    return copyWith(
      isUsernameValid: isUsernameValid,
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: message,
    );
  }

  RegisterState copyWith({
    bool isUsernameValid,
    bool isPasswordValid,
    bool isConfirmPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return RegisterState(
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
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
