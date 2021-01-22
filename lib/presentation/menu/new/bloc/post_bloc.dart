import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/menu/new/bloc/post_event.dart';
import 'package:flutter_app_cchat/presentation/menu/new/bloc/post_state.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/bloc/post_profile_user_event.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/bloc/post_profile_user_state.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UserRepository userRepository;

  PostBloc({@required this.userRepository});

  @override
  PostState get initialState => PostState.empty();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPost) {
      yield* _mapLoadPostToState();
    } else if (event is RefreshPost) {
      yield PostState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      yield* _mapLoadPostToState();
    } else if (event is RemovePost) {
      yield PostState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      // yield* _mapRemovePostToState(event.id);
    }
  }

  Stream<PostState> _mapLoadPostToState() async* {
    try {
      final response = await userRepository.getNew();
      yield PostState.success(state.update(
          post: response.data.data.list,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield PostState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

// Stream<PostState> _mapRemovePostToState(int id) async* {
//   try {
//     final response = await userRepository.removePost(id: id);
//     yield PostState.success(state.update(
//         post: response.data,
//         status: DioStatus(
//             code: DioStatus.API_SUCCESS, message: response.message)));
//
//
//   } catch (e) {
//     yield PostState.failure(
//         state.update(status: DioErrorUtil.handleError(e)));
//   }
// }
}
