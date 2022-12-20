import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String id;
  String title;
  bool status;

  TodoEntity({required this.id, required this.title, required this.status});

  @override
  List<Object?> get props {
    return [id, title, status];
  }
}
