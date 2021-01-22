import 'package:equatable/equatable.dart';

class PostVoucherEvent extends Equatable {
  const PostVoucherEvent();

  List<Object> get props => [];
}

class LoadVoucher extends PostVoucherEvent {}

class RefreshVoucher extends PostVoucherEvent {}

class RemoveVoucher extends PostVoucherEvent {
  final int id;

  RemoveVoucher(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemovePost{id: $id}';
  }
}
