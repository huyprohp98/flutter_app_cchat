import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'home_categorie_new_bests_event.dart';
import 'home_categorie_new_bests_state.dart';

class HomeCategorieNewBestBloc
    extends Bloc<HomeCategoriesNewBestEvent, HomeCategorieNewBestState> {
  final HomeRepository homeRepository;

  HomeCategorieNewBestBloc({@required this.homeRepository});

  @override
  HomeCategorieNewBestState get initialState => HomeCategoriesNewBestLoading();

  @override
  Stream<HomeCategorieNewBestState> mapEventToState(
      HomeCategoriesNewBestEvent event) async* {
    if (event is LoadHomeCategoriesNewBestHot) {
      yield* _mapLoadHomeCategoriesHotToState();
    } else if (event is RefreshHomeCategoriesNewBestHot) {
      yield HomeCategoriesNewBestLoading();
      yield* _mapLoadHomeCategoriesHotToState();
    }
  }

  Stream<HomeCategorieNewBestState> _mapLoadHomeCategoriesHotToState() async* {
    final currentState = state;
    try {
      if (state is HomeCategoriesNewBestLoading) {
        final product = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT, offset: 0, sort: 2);
        yield HomeCategoriesNewBestLoaded(
            hotProducts: product, hasReachedMax: false);
      }
      if (currentState is HomeCategoriesNewBestLoaded) {
        final product = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: currentState.hotProducts.length,
            sort: 1);
//      await Future.delayed(Duration(seconds: 5), () {});
        yield product.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : HomeCategoriesNewBestLoaded(
                hotProducts: currentState.hotProducts + product,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield HomeCategoriesNewBestNotLoaded('$e');
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
