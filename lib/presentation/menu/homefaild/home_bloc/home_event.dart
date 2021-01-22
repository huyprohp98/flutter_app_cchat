import 'package:equatable/equatable.dart';

class HomeDataEvent extends Equatable {
  const HomeDataEvent();

  List<Object> get props => [];
}

class LoadHomeData extends HomeDataEvent {}

class RefreshHomeData extends HomeDataEvent {}

class RemoveHomeData extends HomeDataEvent {
  final int id;

  RemoveHomeData(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemoveHomeData{id: $id}';
  }
}
