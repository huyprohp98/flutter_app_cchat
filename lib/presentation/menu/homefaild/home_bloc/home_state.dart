import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
import 'package:meta/meta.dart';

class HomeDataState {
  final HomeData homeData;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  HomeDataState(
      {@required this.homeData,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory HomeDataState.empty() {
    return HomeDataState(
        homeData: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory HomeDataState.loading(HomeDataState state) {
    return HomeDataState(
        homeData: state.homeData,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory HomeDataState.failure(HomeDataState state) {
    return HomeDataState(
        homeData: state.homeData,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory HomeDataState.success(HomeDataState state) {
    return HomeDataState(
        homeData: state.homeData,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  get error => null;

  HomeDataState update(
      {HomeData homeData,
      bool isLoading,
      bool isSuccess,
      bool isFailure,
      DioStatus status}) {
    return copyWith(
      homeData: homeData,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      status: status,
    );
  }

  HomeDataState copyWith({
    HomeData homeData,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return HomeDataState(
      homeData: homeData ?? this.homeData,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'homeDataState{homeData: $homeData, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}

class HomeDataLoaded extends HomeDataState {
  final HomeData homeData;

  HomeDataLoaded(this.homeData); //  final User user;

  @override
  List<Object> get props => [homeData];

  @override
  String toString() {
    return 'HomeData  Loaded{user: $homeData}';
  }
}