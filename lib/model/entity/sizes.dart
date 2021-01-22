import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sizes.g.dart';

@JsonSerializable()
class Sizes extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  Sizes(
    this.id,
    this.name,
  );

  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Map<String, dynamic> toJson() => _$SizesToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
      ];

  @override
  String toString() {
    return 'Sizes{id: $id, name: $name,}';
  }
}
