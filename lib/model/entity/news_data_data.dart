import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'news_data.dart';

part 'news_data_data.g.dart';

@JsonSerializable()
class NewsDataData extends Equatable {
  NewsData data;

  NewsDataData(this.data);

  factory NewsDataData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDataDataToJson(this);

  @override
  List<Object> get props => [data];
}
