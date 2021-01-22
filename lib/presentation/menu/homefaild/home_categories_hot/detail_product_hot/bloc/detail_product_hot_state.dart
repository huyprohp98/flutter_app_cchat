
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/detail_news.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:equatable/equatable.dart';

abstract class DetailProductHotState extends Equatable {
  const DetailProductHotState();

  @override
  List<Object> get props => [];
}

class DetailProductHotLoading extends DetailProductHotState {}

class DetailProductHotLoaded extends DetailProductHotState {
  final CategoryProductHotData detailProductHot;

  const DetailProductHotLoaded({this.detailProductHot});

  @override
  List<Object> get props => [detailProductHot];

  @override
  String toString() {
    return 'DetailProductHotLoaded{detailProductHot: $detailProductHot}';
  }
}

class DetailProductHotNotLoaded extends DetailProductHotState {
  final DioStatus status;

  DetailProductHotNotLoaded(this.status);

  @override
  String toString() {
    return 'DetailProductHotNotLoaded{error: $status}';
  }
}
