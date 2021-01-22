import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_list_banner.g.dart';

@JsonSerializable()
class ListBanner extends Equatable {
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "type")
  int type;

  ListBanner(
     this.image,
      this.type);

  factory ListBanner.fromJson(Map<String, dynamic> json) => _$ListBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ListBannerToJson(this);

  @override
  List<Object> get props => [
       image,
    type
      ];

  @override
  String toString() {
    return 'ListBanner{ image: $image,type: $type,}';
  }
}
