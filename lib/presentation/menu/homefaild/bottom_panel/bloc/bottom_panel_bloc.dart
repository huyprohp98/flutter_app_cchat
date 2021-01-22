import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_panel_event.dart';
import 'bottom_panel_state.dart';

class BottomPanelBloc extends Bloc<BottomPanelEvent, BottomPanelState> {
  BottomPanelBloc();

  @override
  BottomPanelState get initialState => BottomMenuVisible();

  @override
  Stream<BottomPanelState> mapEventToState(BottomPanelEvent event) async* {
    if (event is OpenBuyNowPanel) {
      yield* _mapOpenBuyNowPanelToState();
    } else if (event is OpenAddCartPanel) {
      yield* _mapOpenAddCartPanelToState();
    }  else if (event is ClosePanel) {
      yield* _mapClosePanelToState();
    }
  }

  Stream<BottomPanelState> _mapOpenBuyNowPanelToState() async* {
    yield BuyNowPanelOpened();
  }

  Stream<BottomPanelState> _mapOpenAddCartPanelToState() async* {
    yield AddCartPanelOpened();
  }

  Stream<BottomPanelState> _mapClosePanelToState() async* {
    yield BottomMenuVisible();
  }
}
