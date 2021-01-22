import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_color.g.dart';

@JsonSerializable()
class HomeColors extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "color_code")
  String colorCode;

  HomeColors(
     this.id,
      this.name,
      this.colorCode
      );

  factory HomeColors.fromJson(Map<String, dynamic> json) => _$HomeColorsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeColorsToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    colorCode
      ];

  @override
  String toString() {
    return 'HomeColors{ id: $id,name: $name,colorCode: $colorCode,}';
  }
}
