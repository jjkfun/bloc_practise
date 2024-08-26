part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class AddEvent extends TaskEvent{
  final String newData;
   AddEvent(this.newData);
}


class UpdEvent extends TaskEvent{
  final int index;
  final String newData;
  UpdEvent(this.newData, this.index);
}


class DelEvent extends TaskEvent{
  final int index;
  DelEvent(this.index);
}
