import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/preferences/app_preferences.dart';
import 'package:flutter_app_cchat/model/local/pref.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/bloc/register_verify_event.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/bloc/register_verify_state.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class RegisterVerifyBloc
    extends Bloc<RegisterVerifyEvent, RegisterVerifyState> {
  final UserRepository _userRepository;

  RegisterVerifyBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterVerifyState get initialState => RegisterVerifyState.empty();

  @override
  Stream<RegisterVerifyState> mapEventToState(
      RegisterVerifyEvent event) async* {
    if (event is OtpCodeChanged) {
      yield* _mapOtpCodeChangeToState(event.otpCode);
    } else if (event is RegisterVerifySubmitted) {
      yield* _mapFormSubmittedToState(event.username, event.otpCode);
    }
  }

  Stream<RegisterVerifyState> _mapOtpCodeChangeToState(String otpCode) async* {
    yield state.update(isOtpCodeValid: Validator.isValidOtp(otpCode));
  }

  Stream<RegisterVerifyState> _mapFormSubmittedToState(
      String username, String otpCode) async* {
    yield RegisterVerifyState.loading();

    //need refactor
    var isOtpCodeValid = Validator.isValidOtp(otpCode);

    var newState = state.update(
      isOtpCodeValid: isOtpCodeValid,
    );

    yield newState;

    if (newState.isFormValid) {
      try {
        var response = await _userRepository.registerVerify(
            username: username, otpCode: otpCode);
        if (response.status == Endpoint.SUCCESS) {
          final prefs = LocalPref();
          await prefs.saveBool(AppPreferences.new_register, true);
          yield RegisterVerifyState.success(message: response.message);
        } else {
          yield RegisterVerifyState.failure(message: response.message);
        }
      } catch (e) {
        print(e.toString());
        yield RegisterVerifyState.failure(message: e.toString());
      }
    }
  }
}
