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
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTasks>(_onDeleteAllTasks);
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
    List<Task> favoriteTasks = state.favoriteTasks;

    if (task.isDone == false) {
      if (task.isFavorite == false) {
        pendingTasks = [...state.pendingTasks]..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        pendingTasks = [...state.pendingTasks]..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
        favoriteTasks = [...state.favoriteTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavorite == false) {
        completedTasks = [...state.completedTasks]..remove(task);
        pendingTasks.insert(0, task.copyWith(isFavorite: false));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        completedTasks = [...state.completedTasks]..remove(task);
        pendingTasks = [...pendingTasks]
          ..insert(0, task.copyWith(isDone: false));
        favoriteTasks = [...state.favoriteTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
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

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    if (task.isDone == false) {
      if (task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(task);
        pendingTasks = [...state.pendingTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(task);
        pendingTasks = [...state.pendingTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavorite: false));
        favoriteTasks.remove(task);
      }
    } else {
      if (task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(task);
        completedTasks = [...state.completedTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTasks.indexOf(task);
        completedTasks = [...state.completedTasks]
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavorite: false));
        favoriteTasks.remove(task);
      }
    }

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final oldTask = event.oldTask;
    final newTask = event.newTask;

    final List<Task> favoriteTasks = [...state.favoriteTasks];
    final List<Task> pendingTasks = [...state.pendingTasks]
      ..remove(oldTask)
      ..insert(0, newTask);
    final List<Task> completedTask = [...state.completedTasks]..remove(oldTask);

    if (oldTask.isFavorite == true) {
      favoriteTasks
        ..remove(oldTask)
        ..insert(0, newTask);
    }

    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTask,
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    final List<Task> removedTasks = [...(state).removedTasks]..remove(task);
    final List<Task> pendingTasks = [...(state).pendingTasks]..insert(
        0, task.copyWith(isDeleted: false, isDone: false, isFavorite: false));

    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: state.pendingTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: removedTasks));
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;

    final List<Task> removedTasks = [...(state).removedTasks]..clear();

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
