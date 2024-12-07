

import 'package:tarefa/components/task.dart';

class TaskDao{
 static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)'
  ;

 static const String _tablename = 'taskTable';
 static const String _name = 'name';
 static const String _image = 'imagem';
 static const String _difficulty = 'difficulty';

 save(Task task) async{}
 Future<List<Task>> findAll() async{}
 Future<List<Task>> find(String nameTask) async{}
 delete(String nameTask)
}