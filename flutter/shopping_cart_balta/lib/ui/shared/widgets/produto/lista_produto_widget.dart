import 'package:flutter/material.dart';
import 'package:shoppingcartbalta/models/produto/produto_lista_model.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/shared/loader_widget.dart';
import 'package:shoppingcartbalta/ui/product/product_card_widget.dart';

class ListaProduto extends StatelessWidget {
  final List<ProdutoListaModel> produtos;

  ListaProduto({@required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Loader(
        object: produtos,
        callback: list,
      ),
    );
  }


  Widget list(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: ProductCard(
              item: produtos[index],
            ),
          );
        },
    );
  }

}
