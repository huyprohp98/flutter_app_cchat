import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'home_categories_hot_event.dart';
import 'home_categories_hot_state.dart';

class HomeCategoriesHotBloc
    extends Bloc<HomeCategoriesHotEvent, HomeCategoriesHotState> {
  final HomeRepository homeRepository;

  HomeCategoriesHotBloc({@required this.homeRepository});

  @override
  HomeCategoriesHotState get initialState => HomeCategoriesHotLoading();

  @override
  Stream<HomeCategoriesHotState> mapEventToState(
      HomeCategoriesHotEvent event) async* {
    if (event is LoadHomeCategoriesHot) {
      yield* _mapLoadHomeCategoriesHotToState();
    } else if (event is RefreshHomeCategoriesHot) {
      yield HomeCategoriesHotLoading();
      yield* _mapLoadHomeCategoriesHotToState();
    }
  }

  Stream<HomeCategoriesHotState> _mapLoadHomeCategoriesHotToState() async* {
    final currentState = state;
    try {
      if (state is HomeCategoriesHotLoading) {
        final product = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT, offset: 0, sort: 1);
        yield HomeCategoriesHotLoaded(
            hotProducts: product, hasReachedMax: false);
      }
      if (currentState is HomeCategoriesHotLoaded) {
        final product = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: currentState.hotProducts.length,
            sort: 1);
//      await Future.delayed(Duration(seconds: 5), () {});
        yield product.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : HomeCategoriesHotLoaded(
                hotProducts: currentState.hotProducts + product,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield HomeCategoriesHotNotLoaded('$e');
    }
  }

  Future<List<CategoryProductHotData>> _fetchProduct(
      {@required int limit, @required int offset, @required int sort}) async {
    try {
      final response = await homeRepository.getListCategoryProductHot(
          limit: limit, offset: offset, sort: sort);
      return response.data.list;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
