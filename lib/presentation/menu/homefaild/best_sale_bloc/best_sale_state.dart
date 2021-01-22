// import 'package:base_code_project/model/entity/barrel_entity.dart';
// import 'package:base_code_project/utils/dio/dio_status.dart';
// import 'package:meta/meta.dart';
//
// class BestSaleState {
//   final ProductAllData productAllData;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isFailure;
//   final DioStatus status;
//
//   BestSaleState(
//       {@required this.productAllData,
//         @required this.isLoading,
//         @required this.isSuccess,
//         @required this.isFailure,
//         @required this.status});
//
//   factory BestSaleState.empty() {
//     return BestSaleState(
//         productAllData: null,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: false,
//         status: null);
//   }
//
//   factory BestSaleState.loading(BestSaleState state) {
//     return BestSaleState(
//         productAllData: state.productAllData,
//         isLoading: true,
//         isSuccess: false,
//         isFailure: false,
//         status: state.status);
//   }
//
//   factory BestSaleState.failure(BestSaleState state) {
//     return BestSaleState(
//         productAllData: state.productAllData,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: true,
//         status: state.status);
//   }
//
//   factory BestSaleState.success(BestSaleState state) {
//     return BestSaleState(
//         productAllData: state.productAllData,
//         isLoading: false,
//         isSuccess: true,
//         isFailure: false,
//         status: state.status);
//   }
//
//   get error => null;
//
//   BestSaleState update(
//       {ProductAllData productAllData,
//         bool isLoading,
//         bool isSuccess,
//         bool isFailure,
//         DioStatus status}) {
//     return copyWith(
//       productAllData: productAllData,
//       isLoading: false,
//       isSuccess: false,
//       isFailure: false,
//       status: status,
//     );
//   }
//
//   BestSaleState copyWith({
//     ProductAllData productAllData,
//     bool isLoading,
//     bool isSuccess,
//     bool isFailure,
//     DioStatus status,
//   }) {
//     return BestSaleState(
//       productAllData: productAllData ?? this.productAllData,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isFailure: isFailure ?? this.isFailure,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'ProductAllDataState{ProductAllData: $productAllData, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
//   }
// }
//
// class ProductAllDataLoaded extends BestSaleState {
//   final ProductAllData productAllData;
//
//   ProductAllDataLoaded(this.productAllData); //  final User user;
//
//   @override
//   List<Object> get props => [productAllData];
//
//   @override
//   String toString() {
//     return 'ProductAllData Loaded{ProductAllData: $productAllData}';
//   }
// }