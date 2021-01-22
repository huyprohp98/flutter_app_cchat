import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_cchat/model/entity/home_category_product_child.dart';

part 'home_category_product.g.dart';

@JsonSerializable()
class ListCategoryProduct extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "child")
  List<ListCategoryProductChild> child;

  ListCategoryProduct(this.id, this.name, this.image, this.child);

  factory ListCategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryProductFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryProductToJson(this);

  @override
  List<Object> get props => [id, name, image, child];

  @override
  String toString() {
    return 'ListCategoryProduct{ id: $id,name: $name,image: $image,child: $child,}';
  }
}
