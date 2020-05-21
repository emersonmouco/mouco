
import 'package:dio/dio.dart';
import 'package:shoppingcartbalta/configuracoes.dart';
import 'package:shoppingcartbalta/models/categoria/lista_categoria_model.dart';

class CategoriaRepository{
  Future<List<ListaCategoriaModel>> getAll() async {
    var url = "${Configuracoes.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List).map((e) => ListaCategoriaModel.fromJson(e)).toList();
  }
}