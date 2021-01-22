import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/product.dart';
import 'package:equatable/equatable.dart';

abstract class HomeCategoriesHotState extends Equatable {
  const HomeCategoriesHotState();

  @override
  List<Object> get props => [];
}

class HomeCategoriesHotLoading extends HomeCategoriesHotState {}

class HomeCategoriesHotLoaded extends HomeCategoriesHotState {
  final List<CategoryProductHotData> hotProducts;
  final bool hasReachedMax;

  const HomeCategoriesHotLoaded({this.hasReachedMax, this.hotProducts});

  HomeCategoriesHotLoaded copyWith({
    List<CategoryProductHotData> hotProducts,
    bool hasReachedMax,
  }) {
    return HomeCategoriesHotLoaded(
      hotProducts: hotProducts ?? this.hotProducts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [hotProducts, hasReachedMax];
}


class HomeCategoriesHotNotLoaded extends HomeCategoriesHotState {
  final String error;

  HomeCategoriesHotNotLoaded(this.error);

  @override
  String toString() {
    return 'HomeCategoriesHotNotLoaded{error: $error}';
  }
}