import 'package:equatable/equatable.dart';

class DetailProductHotEvent extends Equatable {
  const DetailProductHotEvent();

  List<Object> get props => [];
}

class LoadDetailProduct extends DetailProductHotEvent {
  final int productId;

  LoadDetailProduct(this.productId);

  @override
  String toString() {
    return 'LoadDetailProduct{productId: $productId}';
  }

  List<Object> get props => [productId];
}

class RefreshDetailProduct extends DetailProductHotEvent {
  final int productId;

  RefreshDetailProduct(this.productId);

  @override
  String toString() {
    return 'RefreshDetailProduct{productId: $productId}';
  }

  List<Object> get props => [productId];
}
