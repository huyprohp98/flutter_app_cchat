
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/menu/voucher/bloc/post_voucher_event.dart';
import 'package:flutter_app_cchat/presentation/menu/voucher/bloc/post_voucher_state.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PostVoucherBloc extends Bloc<PostVoucherEvent, PostVoucherState> {
  final UserRepository userRepository;

  PostVoucherBloc({@required this.userRepository});

  @override
  PostVoucherState get initialState => PostVoucherState.empty();

  @override
  Stream<PostVoucherState> mapEventToState(PostVoucherEvent event) async* {
    if (event is LoadVoucher) {
      yield* _mapLoadPostToState();
    } else if (event is RefreshVoucher) {
      yield PostVoucherState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      yield* _mapLoadPostToState();
    } else if (event is RemoveVoucher) {
      yield PostVoucherState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      // yield* _mapRemovePostToState(event.id);
    }
  }

  Stream<PostVoucherState> _mapLoadPostToState() async* {
    try {
      final response = await userRepository.getListVoucher();
      yield PostVoucherState.success(state.update(
          post: response.data,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield PostVoucherState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

// Stream<PostVoucherState> _mapRemovePostToState(int id) async* {
//   try {
//     final response = await userRepository.removePost(id: id);
//     yield PostVoucherState.success(state.update(
//         post: response.data,
//         status: DioStatus(
//             code: DioStatus.API_SUCCESS, message: response.message)));
//
//
//   } catch (e) {
//     yield PostVoucherState.failure(
//         state.update(status: DioErrorUtil.handleError(e)));
//   }
// }
}
