import 'package:equatable/equatable.dart';

class PostBannerEvent extends Equatable {
  const PostBannerEvent();

  List<Object> get props => [];
}

class LoadBanner extends PostBannerEvent {}

class RefreshBanner extends PostBannerEvent {}

class RemoveBanner extends PostBannerEvent {
  final int id;

  RemoveBanner(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemovePost{id: $id}';
  }
}
