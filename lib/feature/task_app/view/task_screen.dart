import 'package:bloc_practise/feature/task_app/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController addController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
        return ListView.builder(
            itemCount: state.names.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3)),
                  height: 100,
                  child: Center(
                    child: ListTile(
                      leading: Text('$index'),
                      title: Text(state.names[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Delete data?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                                BlocProvider.of<TaskCubit>(
                                                        context)
                                                    .deleteData(index);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Yes')),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      updateController.text = state.names[index];
                                      return AlertDialog(
                                        title: const Text('Update data'),
                                        content: TextField(
                                          controller: updateController,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {

                                                if (updateController
                                                    .text.isNotEmpty) {
                                                  BlocProvider.of<TaskCubit>(
                                                          context)
                                                      .updateData(
                                                          index,
                                                          updateController
                                                              .text);
                                                  updateController.clear();
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: const Text('Add data')),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('add data'),
                content: TextField(
                  controller: addController,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        if (addController.text.isNotEmpty) {
                          BlocProvider.of<TaskCubit>(context)
                              .addName(addController.text);
                          addController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add data')),
                ],
              );
            });
      }),
    );
  }
}
