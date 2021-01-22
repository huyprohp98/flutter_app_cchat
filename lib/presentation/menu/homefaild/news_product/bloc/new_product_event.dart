import 'package:equatable/equatable.dart';

class NewProductEvent extends Equatable {
  const NewProductEvent();

  List<Object> get props => [];
}

class LoadNewProduct extends NewProductEvent {}

class RefreshNewProduct extends NewProductEvent {}

class RemoveNewProduct extends NewProductEvent {
  // final int id;
  //
  // RemoveProduct(this.id);
  //
  // List<Object> get props => [id];
  //
  // @override
  // String toString() {
  //   return 'RemoveProduct{id: $id}';
  // }
}
