import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/category.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:flutter_app_cchat/model/entity/vouchers.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class PostCategoryProductState {
  final List<Category> post;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  PostCategoryProductState(
      {@required this.post,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory PostCategoryProductState.empty() {
    return PostCategoryProductState(
        post: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PostCategoryProductState.loading(PostCategoryProductState state) {
    return PostCategoryProductState(
        post: state.post,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory PostCategoryProductState.failure(PostCategoryProductState state) {
    return PostCategoryProductState(
        post: state.post,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory PostCategoryProductState.success(PostCategoryProductState state) {
    return PostCategoryProductState(
        post: state.post,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  PostCategoryProductState update(
      {
        List<Category> post,
        bool isLoading,
      bool isSuccess,
      bool isFailure,
      DioStatus status}) {
    return copyWith(
      post: post,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      status: status,
    );
  }

  PostCategoryProductState copyWith({
    List<Category> post,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return PostCategoryProductState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PostCategoryProductState{post: $post, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
