import 'package:dio/dio.dart';
import 'package:shoppingcartbalta/models/produto/produto_detalhes_model.dart';
import 'package:shoppingcartbalta/models/produto/produto_lista_model.dart';
import 'package:shoppingcartbalta/configuracoes.dart';

class ProdutoRepository{
  Future<List<ProdutoListaModel>> getAll() async {
    var url = "${Configuracoes.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List).map((e) => ProdutoListaModel.fromJson(e)).toList();
  }

  Future<List<ProdutoListaModel>> getCategoria(String categoria) async {
    var url = "${Configuracoes.apiUrl}v1/categories/$categoria/products";
    Response response = await Dio().get(url);
    return (response.data as List).map((e) => ProdutoListaModel.fromJson(e)).toList();
  }

  Future<DetalhesProdutoModel> get(String tag) async {
    var url = "${Configuracoes.apiUrl}v1/products/$tag";
    Response response = await Dio().get(url);
    return DetalhesProdutoModel.fromJson(response.data);
  }


}

