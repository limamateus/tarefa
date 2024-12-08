import 'package:flutter/material.dart';
import 'package:tarefa/components/task.dart';
import 'package:tarefa/data/task_dao.dart';
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
        leading: Container(),
        actions: [
          IconButton(onPressed: (){setState(() {
            
          });}, icon: Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? taks = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(), Text("Carregando")
                    ],),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(), Text("Carregando")
                    ],),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(), Text("Carregando")
                    ],),
                  );
                case ConnectionState.done:
                // TODO: Handle this case.
                  if (snapshot.hasData && taks != null) {
                    if (taks.isNotEmpty) {
                      return ListView.builder(
                          itemCount: taks.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task task = taks[index];
                            return task;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            "Não é uma tarefa",
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return Text("Erro ao carregar as tarefas");
                  break;
              }

              return Text("Erro desconhecido");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) =>
                  FormTask(
                    taskContext: context,
                  ),
            ),
          ).then((value) => setState(() => {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
