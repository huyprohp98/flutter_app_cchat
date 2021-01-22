
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/banner/bloc/post_banner_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/banner/bloc/post_banner_state.dart';


import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PostBannerBloc extends Bloc<PostBannerEvent, PostBannerState> {
  final UserRepository userRepository;

  PostBannerBloc({@required this.userRepository});

  @override
  PostBannerState get initialState => PostBannerState.empty();

  @override
  Stream<PostBannerState> mapEventToState(PostBannerEvent event) async* {
    if (event is LoadBanner) {
      yield* _mapLoadPostToState();
    } else if (event is RefreshBanner) {
      yield PostBannerState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      yield* _mapLoadPostToState();
    } else if (event is RefreshBanner) {
      yield PostBannerState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      // yield* _mapRemovePostToState(event.id);
    }
  }

  Stream<PostBannerState> _mapLoadPostToState() async* {
    try {
      final response = await userRepository.getListBanner();
      yield PostBannerState.success(state.update(
          post: response.data.listBanner,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield PostBannerState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

// Stream<PostBannerState> _mapRemovePostToState(int id) async* {
//   try {
//     final response = await userRepository.removePost(id: id);
//     yield PostBannerState.success(state.update(
//         post: response.data,
//         status: DioStatus(
//             code: DioStatus.API_SUCCESS, message: response.message)));
//
//
//   } catch (e) {
//     yield PostBannerState.failure(
//         state.update(status: DioErrorUtil.handleError(e)));
//   }
// }
}
