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

    emit(TasksState(allTasks: [...state.allTasks, event.task],
    removedTasks: state.removedTasks,
    ));
  }

  void _onCheckIfTaskIsDone(CheckIfTaskIsDone event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    final index = state.allTasks.indexOf(task);
    final List<Task> allTasks = [...state.allTasks]..remove(task);

    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks,removedTasks: state.removedTasks )
    );
  }

    void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    final List<Task> allTasks = [...(state).allTasks]..remove(event.task);
    final List<Task> removedTasks =  [...state.removedTasks,event.task.copyWith(isDeleted: true)];

    emit(TasksState(
      allTasks: allTasks,
      removedTasks: removedTasks
      ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    final List<Task> removedTasks = [...(state).removedTasks]..remove(event.task);

    emit(TasksState(allTasks: state.allTasks,removedTasks:removedTasks ));
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
