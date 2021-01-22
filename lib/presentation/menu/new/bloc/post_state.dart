import 'package:flutter_app_cchat/model/entity/news.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class PostState {
  final List<News> post;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  PostState(
      {@required this.post,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory PostState.empty() {
    return PostState(
        post: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PostState.loading(PostState state) {
    return PostState(
        post: state.post,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory PostState.failure(PostState state) {
    return PostState(
        post: state.post,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory PostState.success(PostState state) {
    return PostState(
        post: state.post,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  PostState update(
      {List<News> post,
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

  PostState copyWith({
    List<News> post,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return PostState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PostState{post: $post, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
