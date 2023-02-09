// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks'].map<Task>((x) => Task.fromJson(x as Map<String,dynamic>),),), //add ?.map<Task>
    );
  }


}
