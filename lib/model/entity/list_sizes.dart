import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_sizes.g.dart';

@JsonSerializable()
class ListSize extends Equatable {
   @JsonKey(name: "sizes")
  List<Sizes> sizes;


  ListSize(
      this.sizes,
     );

  factory ListSize.fromJson(Map<String, dynamic> json) => _$ListSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ListSizeToJson(this);

  @override
  List<Object> get props => [
    sizes,
      ];

  @override
  String toString() {
    return 'ListSize{sizes: $sizes}';
  }
}
