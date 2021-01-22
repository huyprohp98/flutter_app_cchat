import 'package:equatable/equatable.dart';

class PostEvent extends Equatable {
  const PostEvent();

  List<Object> get props => [];
}

class LoadPost extends PostEvent {}

class RefreshPost extends PostEvent {}

class RemovePost extends PostEvent {
  final int id;

  RemovePost(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemovePost{id: $id}';
  }
}
