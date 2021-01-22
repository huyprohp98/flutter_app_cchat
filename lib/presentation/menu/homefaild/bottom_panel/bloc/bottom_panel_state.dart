import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
// import 'package:flutter_app_cchat/model/api/response/product_all_response.dart';
import 'package:flutter_app_cchat/model/entity/product.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:equatable/equatable.dart';

abstract class BottomPanelState extends Equatable {
  const BottomPanelState();

  @override
  List<Object> get props => [];
}

class BottomMenuVisible extends BottomPanelState {}

class BuyNowPanelOpened extends BottomPanelState {}

class AddCartPanelOpened extends BottomPanelState {}
