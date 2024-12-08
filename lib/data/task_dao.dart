import 'package:sqflite/sqflite.dart';
import 'package:tarefa/components/task.dart';
import 'package:tarefa/data/database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _image = 'imagem';
  static const String _difficulty = 'difficulty';

  save(Task task) async {
    print("Acessando o save");
    final Database db = await getDatabase();
    // Verificar se a tarefa já existe
    var taskExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);

    if (taskExists.isEmpty) {
      print('a tarefa não existia');
      return await db.insert(_tablename, taskMap);
    } else {
      // Caso existe da um update
      print('Tarefa já existe');
      return await db.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.name]);
    }
  }



  Map<String, dynamic> toMap(Task task) {
    print('Convertendo uma tarefa em map');

    final Map<String, dynamic> mapTask = Map();
    mapTask[_name] = task.name;
    mapTask[_difficulty] = task.difficulty;
    mapTask[_image] = task.image;

    print("Mapa de Tarefas: $mapTask");

    return mapTask;
  }

  Future<List<Task>> findAll() async {
    print("Acessando o findAll");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print("Procurando dados no banco de dados ... Encontrados:$result");

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("Convertendo em lista toda");
    final List<Task> tasks = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task task = Task(linha[_name], linha[_image], linha[_difficulty]);
      tasks.add(task);
    }
    print("Lista de Tarefas $tasks");
    return tasks;
  }

  Future<List<Task>> find(String nameTask) async {
    print("Convertendo em lista");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
    print("Lista de Tarefas $toList($result)");
    return toList(result);
  }

  delete(String nameTask) async {
    print("Deletando uma tarefa");
    final Database db = await getDatabase();
    return db.delete(_tablename, where: '$_name = ? ', whereArgs: [nameTask]);
  }
}
