// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        removedTasks,
        completedTasks,
        favoriteTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(
        map['pendingTasks'].map<Task>(
          (x) => Task.fromJson(x as Map<String, dynamic>),
        ),
      ), //add ?.map<Task>
      completedTasks: List<Task>.from(
        map['completedTasks'].map<Task>(
          (x) => Task.fromJson(x as Map<String, dynamic>),
        ),
      ), //add ?.map<Task>
      favoriteTasks: List<Task>.from(
        map['favoriteTasks'].map<Task>(
          (x) => Task.fromJson(x as Map<String, dynamic>),
        ),
      ), //add ?.map<Task>
      removedTasks: List<Task>.from(
        map['removedTasks'].map<Task>(
          (x) => Task.fromJson(x as Map<String, dynamic>),
        ),
      ), //add ?.map<Task>
    );
  }
}
