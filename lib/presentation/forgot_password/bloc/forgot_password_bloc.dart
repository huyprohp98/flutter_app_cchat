import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final UserRepository _userRepository;

  ForgotPasswordBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordState get initialState => ForgotPasswordState.empty();

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is UsernameChanged) {
      yield* _mapUsernameChangedToState(event.username);
    } else if (event is ForgotPasswordSubmitted) {
      yield* _mapFormSubmittedToState(event.username);
    }
  }

  Stream<ForgotPasswordState> _mapUsernameChangedToState(String email) async* {
    yield state.update(
      isUsernameValid: Validator.isValidUsername(email),
    );
  }

  Stream<ForgotPasswordState> _mapFormSubmittedToState(String username) async* {
    yield ForgotPasswordState.loading();

    var isValidUsername = Validator.isValidUsername(username);

    var newState = state.update(
      isUsernameValid: isValidUsername,
    );

    yield newState;

    if (newState.isFormValid) {
      try {
        var response = await _userRepository.forgotPassword(
          username: username,
        );
        if (response.status == Endpoint.SUCCESS) {
          yield ForgotPasswordState.success(message: response.message);
        } else {
          yield ForgotPasswordState.failure(message: response.message);
        }
      } catch (e) {
        print('----- ForgotPassword: $e');
        yield ForgotPasswordState.failure();
      }
    }
  }
}
