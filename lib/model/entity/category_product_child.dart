import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'category_product_child.g.dart';

@JsonSerializable()
class CategoryProductChild extends Equatable {
  int id;
  String name;
  String image;

  CategoryProductChild(this.id, this.name, this.image);

  factory CategoryProductChild.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductChildFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductChildToJson(this);

  @override
  List<Object> get props => [id, name, image];

  @override
  String toString() {
    return 'CategoryProductChild{id: $id, name: $name, image: $image}';
  }
}
