import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String title;
  final bool status;

  const TodoEntity(
      {required this.id, required this.title, required this.status});

  @override
  List<Object?> get props {
    return [id, title, status];
  }
}
