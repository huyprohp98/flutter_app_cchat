import 'package:flutter_app_cchat/model/entity/news_product.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class NewProductState {
  final List<NewsProduct> post;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  NewProductState(
      {@required this.post,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory NewProductState.empty() {
    return NewProductState(
        post: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory NewProductState.loading(NewProductState state) {
    return NewProductState(
        post: state.post,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory NewProductState.failure(NewProductState state) {
    return NewProductState(
        post: state.post,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory NewProductState.success(NewProductState state) {
    return NewProductState(
        post: state.post,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  NewProductState update(
      {List<NewsProduct> post,
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

  NewProductState copyWith({
    List<NewsProduct> post,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return NewProductState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NewProductState{post: $post, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
