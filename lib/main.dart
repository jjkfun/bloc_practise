import 'package:bloc_practise/bloc/like/like_bloc.dart';
import 'package:bloc_practise/bloc/like/view/like_screen.dart';
import 'package:bloc_practise/feature/task_app/cubit/task_cubit.dart';
import 'package:bloc_practise/feature/task_app/view/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/counter/view/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => LikeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LikeScreen(),
      ),
    );
  }
}
