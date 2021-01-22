import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'post_diary_response.g.dart';

@JsonSerializable()
class PostDiaryResponse extends BaseResponse {
  PostDiaryResponse();

  factory PostDiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PostDiaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostDiaryResponseToJson(this);
}
