import 'package:flutter/widgets.dart';
import 'package:shoppingcartbalta/models/categoria/lista_categoria_model.dart';
import 'package:shoppingcartbalta/models/produto/produto_lista_model.dart';
import 'package:shoppingcartbalta/repositories/api/categoria_repository.dart';
import 'package:shoppingcartbalta/repositories/produto_repository.dart';

class HomeBloc extends ChangeNotifier{
  final categoriaRepository = new CategoriaRepository();
  final produtoRepository = new ProdutoRepository();

  List<ListaCategoriaModel> categorias;
  List<ProdutoListaModel> produtos;
  String categoriaSelecionada = 'todos';

  HomeBloc(){
    getCategorias();
    getProdutos();
  }

  getCategorias() {
    categoriaRepository.getAll().then((data) {
      this.categorias = data;
      notifyListeners();
    });
  }

  getProdutos() {
    produtoRepository.getAll().then((data) {
     this.produtos = data;
     notifyListeners();
    });
  }

  getProdutosPorCategorias(){
    produtoRepository.getCategoria(categoriaSelecionada).then((data) {
      this.produtos = data;
      notifyListeners();
    });
  }

  mudarCategoria(tag){
    categoriaSelecionada = tag;
    produtos = null;
    getProdutosPorCategorias();
    notifyListeners();
  }

}