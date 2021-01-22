import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/product.dart';
import 'package:equatable/equatable.dart';

abstract class HomeCategorieNewBestState extends Equatable {
  const HomeCategorieNewBestState();

  @override
  List<Object> get props => [];
}

class HomeCategoriesNewBestLoading extends HomeCategorieNewBestState {}

class HomeCategoriesNewBestLoaded extends HomeCategorieNewBestState {
  final List<CategoryProductHotData> hotProducts;
  final bool hasReachedMax;

  const HomeCategoriesNewBestLoaded({this.hasReachedMax, this.hotProducts});

  HomeCategoriesNewBestLoaded copyWith({
    List<CategoryProductHotData> hotProducts,
    bool hasReachedMax,
  }) {
    return HomeCategoriesNewBestLoaded(
      hotProducts: hotProducts ?? this.hotProducts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [hotProducts, hasReachedMax];
}


class HomeCategoriesNewBestNotLoaded extends HomeCategorieNewBestState {
  final String error;

  HomeCategoriesNewBestNotLoaded(this.error);

  @override
  String toString() {
    return 'HomeCategoriesNewBestNotLoaded{error: $error}';
  }
}