import 'package:flutter_app_cchat/model/repo/home_repository.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RelatedProductBloc extends Bloc<RelatedProductHotEvent, RelatedProductHotState> {
  final HomeRepository homeRepository;

  RelatedProductBloc({@required this.homeRepository}) : super();

  @override
  RelatedProductHotState get initialState => RelatedProductHotLoading();

  @override
  Stream<RelatedProductHotState> mapEventToState(RelatedProductHotEvent event) async* {
    if (event is LoadRelatedProduct) {
      yield* _mapLoadNewsDetailToState(event.productId);
    } else if (event is RefreshRelatedProduct) {
      yield RelatedProductHotLoading();
      yield* _mapLoadNewsDetailToState(event.productId);
  }
  }

  Stream<RelatedProductHotState> _mapLoadNewsDetailToState(int productId) async* {
    try {
      final response = await homeRepository.getDetailProduct(productId: productId);
      yield RelatedProductHotLoaded(relatedProductHot: response.data.relatedProduct);
    } catch (e) {
      yield RelatedProductHotNotLoaded(DioErrorUtil.handleError(e));
    }
  }
}
