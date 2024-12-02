import 'package:flutter/material.dart';
import 'package:tarefa/components/task.dart';
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
        children: const [
          Task(
              'Aprender flutter',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              5),
          Task(
              'Aprender a andar',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              2),
          Task(
              'Andar de bike as 5 horas da manhã no pleno domingo com texto muito grande',
              'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
              3),
          Task(
              'Sei lá',
              'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              0),
          Task(
              'Sei lá',
              'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
              4),
          Task(
              'Sei lá',
              'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
              3),
          Task(
              'Sei lá',
              'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
              1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormTask(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
