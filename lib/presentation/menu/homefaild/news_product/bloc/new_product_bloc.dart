import 'package:flutter_app_cchat/model/repo/home_repository.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/menu/new/bloc/post_event.dart';
import 'package:flutter_app_cchat/presentation/menu/new/bloc/post_state.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'new_product_event.dart';
import 'new_product_state.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  final HomeRepository homeRepository;

  NewProductBloc({@required this.homeRepository});

  @override
  NewProductState get initialState => NewProductState.empty();

  @override
  Stream<NewProductState> mapEventToState(NewProductEvent event) async* {
    if (event is LoadNewProduct) {
      yield* _mapLoadPostToState();
    } else if (event is RefreshNewProduct) {
      yield NewProductState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      yield* _mapLoadPostToState();
    } else if (event is RemoveNewProduct) {
      yield NewProductState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      // yield* _mapRemovePostToState(event.id);
    }
  }

  Stream<NewProductState> _mapLoadPostToState() async* {
    try {
      final response = await homeRepository.getNewProduct(limit: 10,offset: 0,type: 0,searchWord: '');
      yield NewProductState.success(state.update(
          post: response.data.rows,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield NewProductState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

// Stream<NewProductState> _mapRemovePostToState(int id) async* {
//   try {
//     final response = await homeRepository.removePost(id: id);
//     yield NewProductState.success(state.update(
//         post: response.data,
//         status: DioStatus(
//             code: DioStatus.API_SUCCESS, message: response.message)));
//
//
//   } catch (e) {
//     yield NewProductState.failure(
//         state.update(status: DioErrorUtil.handleError(e)));
//   }
// }
}
