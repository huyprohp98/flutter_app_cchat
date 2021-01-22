import 'package:flutter_app_cchat/model/entity/list_voucher.dart';
import 'package:flutter_app_cchat/model/entity/vouchers.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class PostVoucherState {
  final List<Vouchers> post;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  PostVoucherState(
      {@required this.post,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory PostVoucherState.empty() {
    return PostVoucherState(
        post: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PostVoucherState.loading(PostVoucherState state) {
    return PostVoucherState(
        post: state.post,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory PostVoucherState.failure(PostVoucherState state) {
    return PostVoucherState(
        post: state.post,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory PostVoucherState.success(PostVoucherState state) {
    return PostVoucherState(
        post: state.post,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  PostVoucherState update(
      {List<Vouchers> post,
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

  PostVoucherState copyWith({
    List<Vouchers> post,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return PostVoucherState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PostVoucherState{post: $post, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
