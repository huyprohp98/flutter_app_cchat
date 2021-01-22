import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BottomPanelEvent extends Equatable {
  const BottomPanelEvent();

  List<Object> get props => [];
}

class OpenBuyNowPanel extends BottomPanelEvent {
}

class OpenAddCartPanel extends BottomPanelEvent {
}

class ClosePanel extends BottomPanelEvent {
}