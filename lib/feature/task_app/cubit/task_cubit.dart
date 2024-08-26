import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  void addName(String newData){
    emit(TaskState(names: [...state.names, newData]));
  }


  void deleteData(int index){
    List<String> updatedList = [...state.names];
    updatedList.removeAt(index);
    emit(TaskState(names: updatedList));
  }


  void updateData(int index, String newData){
    List<String> updatedList = [...state.names];
    updatedList[index] = newData;
    emit(TaskState(names: updatedList));
  }
}
