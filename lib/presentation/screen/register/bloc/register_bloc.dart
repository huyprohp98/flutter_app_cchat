import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/screen/register/bloc/bloc.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is UsernameChanged) {
      yield* _mapUsernameChangedToState(event.username);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password, event.confirmPassword);
    }
     else if (event is ConfirmPasswordChanged) {
      yield* _mapConfirmPasswordChangedToState(
          event.password, event.confirmPassword);
    } else if (event is RegisterSubmitted) {
      yield* _mapFormSubmittedToState(event.username, event.password,
          event.confirmPassword,);
    }
  }

  Stream<RegisterState> _mapUsernameChangedToState(String username) async* {
    yield state.update(
      isUsernameValid: Validator.isValidName(username),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isPasswordValid = Validator.isValidPassword(password);
    var isMatched = true;

    if (confirmPassword.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
        isPasswordValid: isPasswordValid, isConfirmPasswordValid: isMatched);
  }

  Stream<RegisterState> _mapConfirmPasswordChangedToState(
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





  Stream<RegisterState> _mapFormSubmittedToState(
      String username,
      String password,
      String confirmPassword,
     ) async* {
    yield RegisterState.loading();

    try {
      var response = await _userRepository.registerApp(
          username: username,
          password: password,
          confirmPassword: confirmPassword,
        );
      if (response.status == Endpoint.SUCCESS) {
        yield RegisterState.success(message: response.message);
      } else {
        yield RegisterState.failure(message: response.message);
      }
    } catch (e) {
      print("------ Register: $e");
      yield RegisterState.failure();
    }

    //need refactor
//    var isValidUsername = Validator.isValidUsername(username);
//    var isValidPassword = Validator.isValidPassword(password);
//    var isValidConfirmPassword = Validator.isValidPassword(confirmPassword);
//    var isMatched = true;
//    if (isValidPassword && isValidConfirmPassword) {
//      isMatched = password == confirmPassword;
//    }
//
//    var newState = state.update(
//        isUsernameValid: isValidUsername,
//        isPasswordValid: isValidPassword,
//        isConfirmPasswordValid: isValidConfirmPassword && isMatched);
//
//    yield newState;
//
//    if (newState.isFormValid) {
//      try {
//        var response = await _userRepository.registerApp(
//            username: username,
//            password: password,
//            confirmPassword: confirmPassword);
//        if(response.status == Endpoint.SUCCESS){
//          yield RegisterState.success(message: response.message);
//        } else {
//          yield RegisterState.failure(message: response.message);
//        }
//      } catch (e) {
//        print("------ Register: $e");
//        yield RegisterState.failure();
//      }
//    }
  }
}
