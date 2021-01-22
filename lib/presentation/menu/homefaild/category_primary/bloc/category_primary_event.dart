import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';

class CategoryPrimaryEvent extends Equatable {
  const CategoryPrimaryEvent();

  List<Object> get props => [];
}

class ChangeCategoryPrimary extends CategoryPrimaryEvent {
  final Category category;
  final Sizes size;
  final ColorCatergoryProductHot color;
  final double priceBegin;
  final double priceEnd;

  ChangeCategoryPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'ChangeCategoryPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class FilterCategoryPrimary extends CategoryPrimaryEvent {
  final Category category;
  final Sizes size;
  final ColorCatergoryProductHot color;
  final double priceBegin;
  final double priceEnd;

  FilterCategoryPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'FilterCategoryPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class LoadCategoryPrimary extends CategoryPrimaryEvent {
  final Category category;
  final Sizes size;
  final ColorCatergoryProductHot color;
  final double priceBegin;
  final double priceEnd;

  LoadCategoryPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'LoadCategoryPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class RefreshCategoryPrimary extends CategoryPrimaryEvent {
  final Category category;
  final Sizes size;
  final ColorCatergoryProductHot color;
  final double priceBegin;
  final double priceEnd;

  RefreshCategoryPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'RefreshCategoryPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}
