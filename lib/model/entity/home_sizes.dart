import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_sizes.g.dart';

@JsonSerializable()
class HomeSizes extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  HomeSizes(
     this.id,
      this.name);

  factory HomeSizes.fromJson(Map<String, dynamic> json) => _$HomeSizesFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSizesToJson(this);

  @override
  List<Object> get props => [
    id,
    name
      ];

  @override
  String toString() {
    return 'HomeSizes{ id: $id,name: $name,}';
  }
}
