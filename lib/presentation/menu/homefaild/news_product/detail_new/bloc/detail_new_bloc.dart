import 'package:flutter_app_cchat/model/repo/home_repository.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';
import 'detail_new_event.dart';

class DetailNewBloc extends Bloc<DetailNewEvent, DetailNewState> {
  final HomeRepository homeRepository;

  DetailNewBloc({@required this.homeRepository}) : super();

  @override
  DetailNewState get initialState => DetailNewLoading();

  @override
  Stream<DetailNewState> mapEventToState(DetailNewEvent event) async* {
    if (event is LoadDetailNew) {
      yield* _mapLoadNewsDetailToState(event.newId);
    } else if (event is RefreshDetailNew) {
      yield DetailNewLoading();
      yield* _mapLoadNewsDetailToState(event.newId);
  }
  }

  Stream<DetailNewState> _mapLoadNewsDetailToState(int newId) async* {
    try {
      final response = await homeRepository.getDetailNew(newId: newId);
      yield DetailNewLoaded(news: response.data);
    } catch (e) {
      yield DetailNewNotLoaded(DioErrorUtil.handleError(e));
    }
  }
}
