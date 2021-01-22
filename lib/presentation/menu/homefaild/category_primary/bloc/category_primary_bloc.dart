import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'category_primary_event.dart';
import 'category_primary_state.dart';

class CategoryPrimaryBloc
    extends Bloc<CategoryPrimaryEvent, CategoryPrimaryState> {
  final HomeRepository homeRepository;

  CategoryPrimaryBloc({@required this.homeRepository}): super();

  @override
  CategoryPrimaryState get initialState => CategoryPrimaryLoading();

  @override
  Stream<CategoryPrimaryState> mapEventToState(
      CategoryPrimaryEvent event) async* {
    if (event is FilterCategoryPrimary) {
      yield CategoryPrimaryLoading();
      print('event is FilterCategoryPrimary');
      print('event.priceBegin ${event.priceBegin}');
      print('event.priceEnd ${event.priceEnd}');
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is ChangeCategoryPrimary) {
      yield CategoryPrimaryLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is LoadCategoryPrimary) {
//      yield CategoryPrimaryLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    } else if (event is RefreshCategoryPrimary) {
      yield CategoryPrimaryLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
  }

  Stream<CategoryPrimaryState> _mapLoadingState(
      Category category,
      Sizes size,
      ColorCatergoryProductHot color,
      double priceBegin,
      double priceEnd) async* {
    final currentState = state;
    try {
      if (state is CategoryPrimaryLoading) {
        final products = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: 0,
            categoryId: category.id,
            colorId: color != null ? color.id : null,
            sizeId: size != null ? size.id : null,
            priceBegin: priceBegin,
            priceEnd: priceEnd);
        yield CategoryPrimaryLoaded(
          // products: products, category: category, hasReachedMax: false);
          products: products, category: category,
        );
      }
      if (currentState is CategoryPrimaryLoaded) {
        final products = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: currentState.products.length,
            categoryId: category.id,
            colorId: color != null ? color.id : null,
            sizeId: size != null ? size.id : null,
            priceBegin: priceBegin,
            priceEnd: priceEnd);
        // yield products.isEmpty
        //     ? currentState.copyWith(hasReachedMax: true)
        //     : CategoryPrimaryLoaded(
        //         products: currentState.products + products,
        //         hasReachedMax: false,
        //       );
        yield products.isEmpty
            ? currentState.copyWith()
            : CategoryPrimaryLoaded(
                products: currentState.products + products,
              );
      }
    } catch (e) {
      print(e);
      yield CategoryPrimaryNotLoaded('$e');
    }
  }

  Future<List<CategoryProductHotData>> _fetchProduct(
      {@required int limit,
      @required int offset,
      @required int categoryId,
      @required int sizeId,
      @required int colorId,
      @required double priceBegin,
      @required double priceEnd}) async {
    try {
      final response = await homeRepository.getProductByAttr(
          limit: limit,
          offset: offset,
          categoryId: categoryId,
          sizeId: sizeId,
          colorId: colorId,
          priceBegin: priceBegin,
          priceEnd: priceEnd);
      return response.data.list;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
