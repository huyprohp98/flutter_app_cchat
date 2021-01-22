import 'package:equatable/equatable.dart';

class PostCategoryProductEvent extends Equatable {
  const PostCategoryProductEvent();

  List<Object> get props => [];
}

class LoadCategoryProduct extends PostCategoryProductEvent {}

class RefreshCategoryProduct extends PostCategoryProductEvent {}

class RemoveCategoryProduct extends PostCategoryProductEvent {
  // final int id;
  //
  // RemoveBanner(this.id);
  //
  // List<Object> get props => [id];
  //
  // @override
  // String toString() {
  //   return 'RemovePost{id: $id}';
  // }
}
