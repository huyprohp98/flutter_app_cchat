import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'news_product.dart';

part 'news_list.g.dart';

@JsonSerializable()
class NewsList extends Equatable {
  @JsonKey(name: "rows")
  List<NewsProduct> rows;

  NewsList(this.rows);

  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);

  @override
  List<Object> get props => [rows];
}
