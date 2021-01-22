import 'package:flutter_app_cchat/app/auth_bloc/authentication_bloc.dart';
import 'package:flutter_app_cchat/app/auth_bloc/authentication_event.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_endpoint.dart';
import 'package:flutter_app_cchat/model/api/dio_provider.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc(
      {@required UserRepository userRepository,
      AuthenticationBloc authenticationBloc})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _authenticationBloc = authenticationBloc;

  @override
  get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginUsernameChanged && event is! LoginPasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is LoginUsernameChanged || event is LoginPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitUsernamePasswordEvent) {
      yield* _mapLoginSubmitUsernamePasswordEventToState(
          event.email, event.password);
    } else if (event is LoginUsernameChanged) {
      yield* _mapLoginUsernameChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event.password);
    }
  }

  Stream<LoginState> _mapLoginSubmitUsernamePasswordEventToState(
      String username, String password) async* {
    try {
      yield LoginState.loading();

      var response = await _userRepository.loginApp(
          username: username, password: password);

      if (response.status == Endpoint.SUCCESS) {
        DioProvider.bearer(response.data.token);
        yield LoginState.success(
            message: response.message, token: response.data.token);
        _authenticationBloc.add(LoggedIn(response.data.token));
      } else {
        yield LoginState.failure(message: response.message);
      }
    } catch (e) {
      yield LoginState.failure(message: e.toString());
    }
  }

  Stream<LoginState> _mapLoginUsernameChangedToState(String userName) async* {
    yield state.update(isUsernameValid: Validator.isValidUsername(userName));
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validator.isValidPassword(password));
  }
}
