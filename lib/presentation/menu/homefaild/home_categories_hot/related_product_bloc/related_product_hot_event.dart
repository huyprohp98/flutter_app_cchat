import 'package:equatable/equatable.dart';

class RelatedProductHotEvent extends Equatable {
  const RelatedProductHotEvent();

  List<Object> get props => [];
}

class LoadRelatedProduct extends RelatedProductHotEvent {
  final int productId;

  LoadRelatedProduct(this.productId);

  @override
  String toString() {
    return 'LoadRelatedProduct{productId: $productId}';
  }

  List<Object> get props => [productId];
}

class RefreshRelatedProduct extends RelatedProductHotEvent {
  final int productId;

  RefreshRelatedProduct(this.productId);

  @override
  String toString() {
    return 'RefreshRelatedProduct{productId: $productId}';
  }

  List<Object> get props => [productId];
}
