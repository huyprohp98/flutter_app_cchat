import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banners extends Equatable {
  String image;
  int type;

  Banners({this.image, this.type});

  factory Banners.fromJson(Map<String, dynamic> json) => _$BannersFromJson(json);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

  @override
  List<Object> get props => [image, type];

  @override
  String toString() {
    return 'Banner{image: $image, type: $type}';
  }
}
