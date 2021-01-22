import 'package:equatable/equatable.dart';

class DetailNewEvent extends Equatable {
  const DetailNewEvent();

  List<Object> get props => [];
}

class LoadDetailNew extends DetailNewEvent {
  final int newId;

  LoadDetailNew(this.newId);

  @override
  String toString() {
    return 'LoadDetailNew{newId: $newId}';
  }

  List<Object> get props => [newId];
}

class RefreshDetailNew extends DetailNewEvent {
  final int newId;

  RefreshDetailNew(this.newId);

  @override
  String toString() {
    return 'RefreshDetailNew{newID: $newId}';
  }

  List<Object> get props => [newId];
}
