import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:taskapp/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<CheckIfTaskIsDone>(_onCheckIfTaskIsDone);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTasks: [...state.pendingTasks, event.task],
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onCheckIfTaskIsDone(CheckIfTaskIsDone event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;

    task.isDone == false
        ? {
            pendingTasks = [...state.pendingTasks]..remove(task),
            completedTasks = [...state.completedTasks]
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedTasks = [...state.completedTasks]..remove(task),
            pendingTasks = [...state.pendingTasks]
              ..insert(0, task.copyWith(isDone: false))
          };

    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    // final List<Task> allTasks = [...(state).allTasks]..remove(event.task);
    final List<Task> removedTasks = [
      ...state.removedTasks,
      event.task.copyWith(isDeleted: true)
    ];

    emit(TasksState(
        pendingTasks: [...state.pendingTasks]..remove(task),
        completedTasks: [...state.completedTasks]..remove(task),
        favoriteTasks: [...state.favoriteTasks]..remove(task),
        removedTasks: removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    final List<Task> removedTasks = [...(state).removedTasks]..remove(task);

    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.pendingTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: removedTasks));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
