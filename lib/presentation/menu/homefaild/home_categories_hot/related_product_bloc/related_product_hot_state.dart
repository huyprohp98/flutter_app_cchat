
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/detail_news.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:equatable/equatable.dart';

abstract class RelatedProductHotState extends Equatable {
  const RelatedProductHotState();

  @override
  List<Object> get props => [];
}

class RelatedProductHotLoading extends RelatedProductHotState {}

class RelatedProductHotLoaded extends RelatedProductHotState {
  final List<CategoryProductHotData> relatedProductHot;

  const RelatedProductHotLoaded({this.relatedProductHot});

  @override
  List<Object> get props => [relatedProductHot];

  @override
  String toString() {
    return 'RelatedProductHotLoaded{relatedProductHot: $relatedProductHot}';
  }
}

class RelatedProductHotNotLoaded extends RelatedProductHotState {
  final DioStatus status;

  RelatedProductHotNotLoaded(this.status);

  @override
  String toString() {
    return 'RelatedProductHotNotLoaded{error: $status}';
  }
}
