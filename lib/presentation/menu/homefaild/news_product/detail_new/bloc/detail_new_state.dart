
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/detail_news.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:equatable/equatable.dart';

abstract class DetailNewState extends Equatable {
  const DetailNewState();

  @override
  List<Object> get props => [];
}

class DetailNewLoading extends DetailNewState {}

class DetailNewLoaded extends DetailNewState {
  final DetailNews news;

  const DetailNewLoaded({this.news});

  @override
  List<Object> get props => [news];

  @override
  String toString() {
    return 'DetailNewLoaded{New: $news}';
  }
}

class DetailNewNotLoaded extends DetailNewState {
  final DioStatus status;

  DetailNewNotLoaded(this.status);

  @override
  String toString() {
    return 'DetailNewNotLoaded{error: $status}';
  }
}
