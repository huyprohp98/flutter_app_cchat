import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData extends Equatable {
  @JsonKey(name: "list_banner")
  List<Banners> listBanner;

  @JsonKey(name: "category_product")
  List<Category> category;

  @JsonKey(name: "sizes")
  List<AttrSize> sizes;

  @JsonKey(name: "colors")
  List<AttrColor> colors;

  HomeData({this.listBanner, this.category, this.sizes, this.colors});

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

  @override
  List<Object> get props => [listBanner, category, sizes, colors];
}
