import 'package:flutter/material.dart';

class FormTask extends StatefulWidget {
  const FormTask({super.key});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficutyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
      ),
      body: Center(
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
                      print(nameController.text);
                      print(int.parse(difficutyController.text));
                      print(imageController.text);
                    },
                    child: Text("Adicionar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
