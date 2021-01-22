// import 'package:base_code_project/model/repo/user_repository.dart';
// import 'package:base_code_project/utils/dio/dio_error_util.dart';
// import 'package:base_code_project/utils/dio/dio_status.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import 'bloc.dart';
//
// class BestSaleBloc extends Bloc<BestSaleEvent, BestSaleState> {
//   final UserRepository userRepository;
//
//   BestSaleBloc({@required this.userRepository});
//
//   @override
//   BestSaleState get initialState => BestSaleState.empty();
//
//   @override
//   Stream<BestSaleState> mapEventToState(BestSaleEvent event) async* {
//     if (event is LoadBestSale) {
//       yield* _mapLoadBestSaleToState();
//     } else if (event is RefreshBestSale) {
//       yield BestSaleState.loading(state.copyWith(
//           status: DioStatus(
//             code: DioStatus.API_PROGRESS,
//           )));
//       yield* _mapLoadBestSaleToState();
//     } else if (event is RemoveBestSale) {
//       yield BestSaleState.loading(state.copyWith(
//           status: DioStatus(
//             code: DioStatus.API_PROGRESS,
//           )));
//       // yield* _mapRemoveBestSaleToState(event.id);
//     }
//   }
//
//   Stream<BestSaleState> _mapLoadBestSaleToState() async* {
//     try {
//       final response = await userRepository.getBestSale(sort: 1);
//       yield BestSaleState.success(state.update(
//           productAllData: response.data,
//           status: DioStatus(
//               code: DioStatus.API_SUCCESS, message: response.message)));
//       print("____________________________");
//       print(response.data);
//       print(response.message);
//       print(response.status);
//     } catch (e) {
//       yield BestSaleState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
//
// // Stream<BestSaleState> _mapRemoveBestSaleToState(int id) async* {
// //   try {
// //     final response = await userRepository.removeBestSale(id: id);
// //     yield BestSaleState.success(state.update(
// //         BestSale: response.data,
// //         status: DioStatus(
// //             code: DioStatus.API_SUCCESS, message: response.message)));
// //
// //
// //   } catch (e) {
// //     yield BestSaleState.failure(
// //         state.update(status: DioErrorUtil.handleError(e)));
// //   }
// // }
// }
