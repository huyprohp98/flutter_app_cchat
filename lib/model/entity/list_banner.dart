import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_banner.g.dart';

@JsonSerializable()
class ListBanner extends Equatable {
  @JsonKey(name: "list_banner")
  List<Banners> listBanner;

  ListBanner(this.listBanner);

  factory ListBanner.fromJson(Map<String, dynamic> json) =>
      _$ListBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ListBannerToJson(this);

  @override
  List<Object> get props => [listBanner];
}
