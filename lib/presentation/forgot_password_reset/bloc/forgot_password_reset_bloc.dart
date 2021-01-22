import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'forgot_password_reset_event.dart';
import 'forgot_password_reset_state.dart';

class ForgotPasswordResetBloc
    extends Bloc<ForgotPasswordResetEvent, ForgotPasswordResetState> {
  final UserRepository _userRepository;

  ForgotPasswordResetBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordResetState get initialState => ForgotPasswordResetState.empty();

  @override
  Stream<ForgotPasswordResetState> mapEventToState(
      ForgotPasswordResetEvent event) async* {
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password, event.confirmPassword);
    } else if (event is ConfirmPasswordChanged) {
      yield* _mapConfirmPasswordChangedToState(
          event.password, event.confirmPassword);
    } else if (event is ForgotPasswordResetSubmitted) {
      yield* _mapFormSubmittedToState(
          event.username, event.otpCode, event.password, event.confirmPassword);
    }
  }

  Stream<ForgotPasswordResetState> _mapPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isPasswordValid = Validator.isValidPassword(password);
    var isMatched = true;

    if (confirmPassword.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
        isPasswordValid: isPasswordValid, isConfirmPasswordValid: isMatched);
  }

  Stream<ForgotPasswordResetState> _mapConfirmPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isConfirmPasswordValid = Validator.isValidPassword(confirmPassword);
    var isMatched = true;

    if (password.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
      isConfirmPasswordValid: isConfirmPasswordValid && isMatched,
    );
  }

  Stream<ForgotPasswordResetState> _mapFormSubmittedToState(String username,
      String otpCode, String password, String confirmPassword) async* {
    yield ForgotPasswordResetState.loading();

    var isValidPassword = Validator.isValidPassword(password);
    var isValidConfirmPassword = Validator.isValidPassword(confirmPassword);
    var isMatched = true;
    if (isValidPassword && isValidConfirmPassword) {
      isMatched = password == confirmPassword;
    }

    var newState = state.update(
        isPasswordValid: isValidPassword,
        isConfirmPasswordValid: isValidConfirmPassword && isMatched);

    yield newState;

    if (newState.isFormValid) {
//      yield ForgotPasswordResetState.loading();

      try {
        var response = await _userRepository.forgotPasswordReset(
          username: username,
          otpCode: otpCode,
          password: password,
          confirmPassword: confirmPassword,
        );
//        await Future.delayed(Duration(seconds: 3));
        if (response.status == Endpoint.SUCCESS) {
          yield ForgotPasswordResetState.success(message: response.message);
        } else {
          yield ForgotPasswordResetState.failure(message: response.message);
        }
      } catch (e) {
        print(e);
        yield ForgotPasswordResetState.failure(message: e.toString());
      }
    }
  }
}
