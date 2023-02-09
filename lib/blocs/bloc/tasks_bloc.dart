import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskapp/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<TasksEvent>((event, emit) {});
  }
}
