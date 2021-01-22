import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'color_catergory_product_hot.g.dart';

@JsonSerializable()
class ColorCatergoryProductHot extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "color_code")
  String colorCode;
  


  ColorCatergoryProductHot(
      this.id,
      this.name,
      this.colorCode,
      );

  factory ColorCatergoryProductHot.fromJson(Map<String, dynamic> json) => _$ColorCatergoryProductHotFromJson(json);

  Map<String, dynamic> toJson() => _$ColorCatergoryProductHotToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    colorCode,

      ];

  @override
  String toString() {
    return 'ColorCatergoryProductHot{id: $id, name: $name, colorCode: $colorCode,}';
  }
}
