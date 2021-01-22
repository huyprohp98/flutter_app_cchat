import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'forgot_password_verify_event.dart';
import 'forgot_password_verify_state.dart';

class ForgotPasswordVerifyBloc
    extends Bloc<ForgotPasswordVerifyEvent, ForgotPasswordVerifyState> {
  final UserRepository _userRepository;

  ForgotPasswordVerifyBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordVerifyState get initialState =>
      ForgotPasswordVerifyState.empty();

  @override
  Stream<ForgotPasswordVerifyState> mapEventToState(
      ForgotPasswordVerifyEvent event) async* {
    if (event is OtpCodeChanged) {
      yield* _mapOtpCodeChangeToState(event.otpCode);
    } else if (event is ForgotPasswordVerifySubmitted) {
      yield* _mapFormSubmittedToState(event.username, event.otpCode);
    }
  }

  Stream<ForgotPasswordVerifyState> _mapOtpCodeChangeToState(
      String otpCode) async* {
    yield state.update(isOtpCodeValid: Validator.isValidOtp(otpCode));
  }

  Stream<ForgotPasswordVerifyState> _mapFormSubmittedToState(
      String username, String otpCode) async* {
    yield ForgotPasswordVerifyState.loading();

    //need refactor
    var isOtpCodeValid = Validator.isValidOtp(otpCode);

    var newState = state.update(
      isOtpCodeValid: isOtpCodeValid,
    );

    yield newState;

    if (newState.isFormValid) {
      try {
        var response = await _userRepository.forgotPasswordVerify(
            username: username, otpCode: otpCode);
        if (response.status == Endpoint.SUCCESS) {
          yield ForgotPasswordVerifyState.success(message: response.message);
        } else {
          yield ForgotPasswordVerifyState.failure(message: response.message);
        }
      } catch (e) {
        print(e.toString());
        yield ForgotPasswordVerifyState.failure(message: e.toString());
      }
    }
  }
}
