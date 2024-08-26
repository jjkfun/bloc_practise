import 'package:bloc/bloc.dart';
import 'package:bloc_practise/feature/task_app/cubit/task_cubit.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddEvent>((event, emit) {
      emit(TaskState(task: [...state.task, event.newData]));
    });

    on<UpdEvent>((event, emit) {
      List<String> updList = [...state.task];
      updList[event.index] = event.newData;
      emit(TaskState(task:updList));
    });

    on<DelEvent>((event, emit){
      List<String> delList = [...state.task];
      delList.removeAt(event.index);
      emit(TaskState(task:delList));
    });
  }
}
