
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/bloc/post_category_product_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/bloc/post_category_product_state.dart';

import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PostCategoryProductBloc extends Bloc<PostCategoryProductEvent, PostCategoryProductState> {
  final UserRepository userRepository;

  PostCategoryProductBloc({@required this.userRepository});

  @override
  PostCategoryProductState get initialState => PostCategoryProductState.empty();

  @override
  Stream<PostCategoryProductState> mapEventToState(PostCategoryProductEvent event) async* {
    if (event is LoadCategoryProduct) {
      yield* _mapLoadPostToState();
    } else if (event is RefreshCategoryProduct) {
      yield PostCategoryProductState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      yield* _mapLoadPostToState();
    } else if (event is RemoveCategoryProduct) {
      yield PostCategoryProductState.loading(state.copyWith(
          status: DioStatus(
            code: DioStatus.API_PROGRESS,
          )));
      // yield* _mapRemovePostToState(event.id);
    }
  }

  Stream<PostCategoryProductState> _mapLoadPostToState() async* {
    try {
      final response = await userRepository.getListCategoryProduct();
      yield PostCategoryProductState.success(state.update(
          post: response.data.categoryProduct,
          status: DioStatus(
              code: DioStatus.API_SUCCESS, message: response.message)));
      print("____________________________");
      print(response.data);
      print(response.message);
      print(response.status);
    } catch (e) {
      yield PostCategoryProductState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

}
