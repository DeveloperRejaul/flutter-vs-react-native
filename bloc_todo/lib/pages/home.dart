import 'package:bloc_todo/cubit/todo_cubit.dart';
import 'package:bloc_todo/models/todo_model.dart';
import 'package:bloc_todo/pages/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todo) {
          return ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todo[index].name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_right_alt_rounded,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const InputPage();
          }));
        },
      ),
    );
  }
}
