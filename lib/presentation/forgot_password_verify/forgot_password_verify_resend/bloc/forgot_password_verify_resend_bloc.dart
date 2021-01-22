import 'dart:async';

import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';

import 'forgot_password_verify_resend_event.dart';
import 'forgot_password_verify_resend_state.dart';

class ForgotPasswordVerifyResendBloc extends Bloc<
    ForgotPasswordVerifyResendEvent, ForgotPasswordVerifyResendState> {
  final UserRepository _userRepository;

  StreamSubscription _streamSubscription;

  ForgotPasswordVerifyResendBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordVerifyResendState get initialState =>
      ForgotPasswordVerifyResendState.empty();

  @override
  Stream<ForgotPasswordVerifyResendState> mapEventToState(
      ForgotPasswordVerifyResendEvent event) async* {
    if (event is TimeInit) {
      yield* _mapTimeInitToState(event.time);
    } else if (event is TimeChanged) {
      yield* _mapTimeChangeToState(event.time);
    } else if (event is ForgotPasswordResendOtp) {
      yield* _mapResendOtpToState(event.username);
    }
  }

  Stream<ForgotPasswordVerifyResendState> _mapTimeInitToState(
      Duration time) async* {
    CountdownTimer _countDownTimer;
    _countDownTimer = new CountdownTimer(time, Duration(seconds: 1));
    _streamSubscription = _countDownTimer.listen(null);
    _streamSubscription.onData((duration) {
      print('time: ${duration.remaining.inSeconds}');
      this.add(TimeChanged(time: duration.remaining.inSeconds));
    });

    _streamSubscription.onDone(() async* {
      _streamSubscription.cancel();
    });
  }

  Stream<ForgotPasswordVerifyResendState> _mapTimeChangeToState(
      int time) async* {
    yield state.update(
        time: time, isTimeValid: Validator.isValidResendOtp(time));
  }

  Stream<ForgotPasswordVerifyResendState> _mapResendOtpToState(
      String username) async* {
    yield ForgotPasswordVerifyResendState.loading();
    try {
      var response =
          await _userRepository.resendForgotPasswordOtp(username: username);

      if (response.status == Endpoint.SUCCESS) {
        yield ForgotPasswordVerifyResendState.success(
            message: response.message);
      } else {
        yield ForgotPasswordVerifyResendState.failure(
            message: response.message);
      }
    } catch (e) {
      print(e.toString());
      yield ForgotPasswordVerifyResendState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
