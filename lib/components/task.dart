import 'package:flutter/material.dart';
import 'package:tarefa/components/difficuty_level.dart';

class Task extends StatefulWidget {
  final String name;
  final String image;
  final int difficulty;

  Task(this.name, this.image, this.difficulty, {super.key});
  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow
                                    .ellipsis // Previnir que o texto quebre o layout
                            ),
                          ),
                        ),
                        Difficulty(difficutyLevel: widget.difficulty)
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                        },
                        child: const Icon(Icons.arrow_drop_up))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficulty > 0)
                            ? (widget.nivel / widget.difficulty) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "nivel : ${widget.nivel}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}