import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_data.g.dart';

@JsonSerializable()
class NewsData extends Equatable {
  List<News> list;

  NewsData(this.list);

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);

  @override
  List<Object> get props => [list];
}
