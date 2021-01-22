import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_category_product_child.g.dart';

@JsonSerializable()
class ListCategoryProductChild extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;

  ListCategoryProductChild(
      this.id,
     this.image,
      this.name,
      );

  factory ListCategoryProductChild.fromJson(Map<String, dynamic> json) => _$ListCategoryProductChildFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryProductChildToJson(this);

  @override
  List<Object> get props => [
    id,
    image,
    name
      ];

  @override
  String toString() {
    return 'ListCategoryProductChild{ id: $id,image: $image,type: $name,}';
  }
}
