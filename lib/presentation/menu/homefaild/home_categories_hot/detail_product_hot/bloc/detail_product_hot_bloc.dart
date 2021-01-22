import 'package:flutter_app_cchat/model/repo/home_repository.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class DetailProductBloc extends Bloc<DetailProductHotEvent, DetailProductHotState> {
  final HomeRepository homeRepository;

  DetailProductBloc({@required this.homeRepository}) : super();

  @override
  DetailProductHotState get initialState => DetailProductHotLoading();

  @override
  Stream<DetailProductHotState> mapEventToState(DetailProductHotEvent event) async* {
    if (event is LoadDetailProduct) {
      yield* _mapLoadNewsDetailToState(event.productId);
    } else if (event is RefreshDetailProduct) {
      yield DetailProductHotLoading();
      yield* _mapLoadNewsDetailToState(event.productId);
  }
  }

  Stream<DetailProductHotState> _mapLoadNewsDetailToState(int productId) async* {
    try {
      final response = await homeRepository.getDetailProduct(productId: productId);
      yield DetailProductHotLoaded(detailProductHot: response.data.product);
    } catch (e) {
      yield DetailProductHotNotLoaded(DioErrorUtil.handleError(e));
    }
  }
}
