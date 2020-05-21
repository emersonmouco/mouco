import 'package:api_to_sqlite/configuracoes/configuracoes.dart';
import 'package:api_to_sqlite/model/empregado_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    //se o banco existir, return banco
    if(_database != null) return _database;

    //se o banco nao existir, cria um
    _database = await initDB();

    return _database;
  }

  //Criar o BD e a tabela Empregado
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'gerenciar_empregados.db');

    return await openDatabase(path, version: 1, onOpen: (db){},
      onCreate: (Database db, int version) async {
        await db.execute(CREATE_TABLE_EMPREGADO);
      } 
    );
  }

  //INSERINDO EMPREGADO NO BD
  criarEmpregado(Empregado novoEmpregado) async {
    await deleteTodosEmpregados();
    final db = await database;
    final res = await db.insert('Empregado', novoEmpregado.toJson());
  
    return res;
  }

  //deletar todos empregados
  Future<int> deleteTodosEmpregados() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Empregado');
  
    return res;
  }

  Future<List<Empregado>> obterTodosEmpregados() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Empregado");
    
    List<Empregado> list = res.isNotEmpty ? res.map((c) => Empregado.fromJson(c)).toList() : [];

    return list;
  }

}