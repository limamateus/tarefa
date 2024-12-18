import 'package:flutter/material.dart';
import 'package:tarefa/components/task.dart';
import 'package:tarefa/data/task_dao.dart';
import 'package:tarefa/data/task_inherited.dart';

class FormTask extends StatefulWidget {
  const FormTask({required this.taskContext, super.key});

  final BuildContext taskContext;

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficutyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool difficultyValidator(String? value) {
      if (value != null && value.isEmpty) {
        if (int.parse(value) > 5 || int.parse(value) < 1) {
          return true;
        }
      }
      return false;
    }

    bool valueValidator(String? value) {
      if (value != null && value.isEmpty) {
        return true;
      }
      return false;
    }

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              height: 750,
              decoration: BoxDecoration(
                // Decoração do Container
                  color: Colors.black12,
                  // Cor do Container
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // Arredondamento da Borda do container
                  border: Border.all(width: 3) // tamanho da borda
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da Tarefa';
                        }
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Name",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Informe uma dificultade entre 1 e 5';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: difficutyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Dificuldade",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Informe uma url de imagem';
                        }
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Imagem url",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('asserts/imagens/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //print(nameController.text);
                            //print(int.parse(difficutyController.text));
                            // print(imageController.text);

                            TaskDao().save(Task(
                                nameController.text, imageController.text,
                                (int.parse(difficutyController.text)),0));


                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Tarefa criada com Sucesso!"),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Adicionar")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
