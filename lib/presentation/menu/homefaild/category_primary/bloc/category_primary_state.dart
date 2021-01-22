import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';

abstract class CategoryPrimaryState extends Equatable {
  const CategoryPrimaryState();

  @override
  List<Object> get props => [];
}

class CategoryPrimaryLoading extends CategoryPrimaryState {}

class CategoryPrimaryLoaded extends CategoryPrimaryState {
  final List<CategoryProductHotData> products;
  final Category category;
  // final bool hasReachedMax;

  // const CategoryPrimaryLoaded({this.products, this.category, this.hasReachedMax});
  const CategoryPrimaryLoaded({this.products, this.category});


  CategoryPrimaryLoaded copyWith({
    List<CategoryProductHotData> products,
    Category category,
    // bool hasReachedMax,
  }) {
    return CategoryPrimaryLoaded(
      products: products ?? this.products,
      category: category ?? this.category,
      // hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  // List<Object> get props => [products, category, hasReachedMax];
  List<Object> get props => [products, category];



  @override
  String toString() {
    // return 'CategoryPrimaryLoaded{products: $products, category: $category, hasReachedMax: $hasReachedMax}';
    return 'CategoryPrimaryLoaded{products: $products, category: $category}';

  }
}

class CategoryPrimaryNotLoaded extends CategoryPrimaryState {
  final String error;

  CategoryPrimaryNotLoaded(this.error);

  @override
  String toString() {
    return 'CategoryPrimaryNotLoaded{error: $error}';
  }
}