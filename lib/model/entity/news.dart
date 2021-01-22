import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  int id;
  @JsonKey(name: "user_id")
  int userId;
  String name;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "image")
  List<String> image;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "likeCount")
  int likeCount;
  @JsonKey(name: "isLike")
  int isLike;
  @JsonKey(name: "commentCount")
  int commentCount;
  @JsonKey(name: "share")
  dynamic share;

  News(
      this.id,
      this.userId,
      this.name,
      this.avatar,
      this.content,
      this.image,
      this.createdAt,
      this.likeCount,
      this.isLike,
      this.commentCount,
      this.share);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  List<Object> get props => [
        id,
        userId,
        name,
        avatar,
        content,
        image,
        createdAt,
        likeCount,
        isLike,
        commentCount,
        share
      ];

  @override
  String toString() {
    return 'News{id: $id, userId: $userId, name: $name,avatar: $avatar, image: $image, content: $content, , createAt: $createdAt, islike: $isLike, commentCount: $commentCount, likeCount: $likeCount, share: $share,}';
  }
}
