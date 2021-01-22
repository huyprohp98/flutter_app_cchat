import 'dart:async';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/register_verify_resend/bloc/bloc.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';

class RegisterVerifyResendBloc
    extends Bloc<RegisterVerifyResendEvent, RegisterVerifyResendState> {
  final UserRepository _userRepository;

  StreamSubscription _streamSubscription;

  RegisterVerifyResendBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterVerifyResendState get initialState =>
      RegisterVerifyResendState.empty();

  @override
  Stream<RegisterVerifyResendState> mapEventToState(
      RegisterVerifyResendEvent event) async* {
    if (event is TimeInit) {
      yield* _mapTimeInitToState(event.time);
    } else if (event is TimeChanged) {
      yield* _mapTimeChangeToState(event.time);
    } else if (event is RegisterResendOtp) {
      yield* _mapResendOtpToState(event.username);
    }
  }

  Stream<RegisterVerifyResendState> _mapTimeInitToState(Duration time) async* {
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

  Stream<RegisterVerifyResendState> _mapTimeChangeToState(int time) async* {
    yield state.update(
        time: time, isTimeValid: Validator.isValidResendOtp(time));
  }

  Stream<RegisterVerifyResendState> _mapResendOtpToState(
      String username) async* {
    yield RegisterVerifyResendState.loading();
    try {
      var response =
          await _userRepository.resendRegisterOtp(username: username);

      if (response.status == Endpoint.SUCCESS) {
        yield RegisterVerifyResendState.success(message: response.message);
      } else {
        yield RegisterVerifyResendState.failure(message: response.message);
      }
    } catch (e) {
      print(e.toString());
      yield RegisterVerifyResendState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
