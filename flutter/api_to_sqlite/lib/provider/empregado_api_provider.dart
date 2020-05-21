import 'package:api_to_sqlite/configuracoes/configuracoes.dart';
import 'package:api_to_sqlite/model/empregado_model.dart';
import 'package:api_to_sqlite/provider/db_provider.dart';
import 'package:dio/dio.dart';

class EmpregadoApiProvider {

  Future<List<Empregado>> obterTodosEmpregados() async {
    Response response = await Dio().get(Configuracoes.apiUrl); 

    return (response.data as List).map((empregado) {
       print('Inserindo $empregado');
       DBProvider.db.criarEmpregado(Empregado.fromJson(empregado));
    }).toList();
  
  }

  

}