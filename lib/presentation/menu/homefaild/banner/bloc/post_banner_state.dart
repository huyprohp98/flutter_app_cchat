import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:flutter_app_cchat/model/entity/vouchers.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class PostBannerState {
  final List<Banners> post;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  PostBannerState(
      {@required this.post,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory PostBannerState.empty() {
    return PostBannerState(
        post: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PostBannerState.loading(PostBannerState state) {
    return PostBannerState(
        post: state.post,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory PostBannerState.failure(PostBannerState state) {
    return PostBannerState(
        post: state.post,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory PostBannerState.success(PostBannerState state) {
    return PostBannerState(
        post: state.post,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  PostBannerState update(
      {
        List<Banners> post,
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

  PostBannerState copyWith({
    List<Banners> post,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return PostBannerState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PostBannerState{post: $post, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
