import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tarefa/data/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'tarefas.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}

