import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final UserRepository userRepository;

  HomeDataBloc({@required this.userRepository});

  @override
  HomeDataState get initialState => HomeDataState.empty();

  @override
  Stream<HomeDataState> mapEventToState(HomeDataEvent event) async* {
    if (event is LoadHomeData) {
      yield* _mapLoadHomeDataToState();
    } else if (event is RefreshHomeData) {
      yield HomeDataState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapLoadHomeDataToState();
    } else if (event is RemoveHomeData) {
      yield HomeDataState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      // yield* _mapRemoveHomeDataToState(event.id);
    }
  }

  Stream<HomeDataState> _mapLoadHomeDataToState() async* {
    try {
      final response = await userRepository.getHomepage();
      yield HomeDataState.success(state.update(
          homeData: response.data,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield HomeDataState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

  // Stream<HomeDataState> _mapRemoveHomeDataToState(int id) async* {
  //   try {
  //     final response = await userRepository.removeHomeData(id: id);
  //     yield HomeDataState.success(state.update(
  //         HomeData: response.data,
  //         status: DioStatus(
  //             code: DioStatus.API_SUCCESS, message: response.message)));
  //
  //
  //   } catch (e) {
  //     yield HomeDataState.failure(
  //         state.update(status: DioErrorUtil.handleError(e)));
  //   }
  // }
}
