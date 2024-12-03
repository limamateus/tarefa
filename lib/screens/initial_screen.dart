import 'package:flutter/material.dart';
import 'package:tarefa/components/task.dart';
import 'package:tarefa/data/task_inherited.dart';
import 'package:tarefa/screens/form_task.dart';

class InitiaScreem extends StatefulWidget {
  const InitiaScreem({super.key});

  @override
  State<InitiaScreem> createState() => _InitiaScreemState();
}

class _InitiaScreemState extends State<InitiaScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormTask(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
