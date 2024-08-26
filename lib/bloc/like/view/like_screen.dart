import 'package:bloc_practise/bloc/like/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LikeBloc, LikeState>(builder: (context, state) {
          return IconButton(
              onPressed: () => context.read<LikeBloc>().add(Like()),
              icon: state.like
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ));
        }),
      ),
    );
  }
}
