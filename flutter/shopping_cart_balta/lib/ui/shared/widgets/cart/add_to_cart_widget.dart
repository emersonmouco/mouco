import 'package:shoppingcartbalta/models/produto/produto_lista_model.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingcartbalta/blocs/cart_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/models/carrinho/carrinho_item_model.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final ProdutoListaModel item;

  AddToCart({@required this.item});
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = new CarrinhoItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    if (!bloc.itensNoCarrinho(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.adicionarItem(
              cartItem,
            );
            final snackBar =
                SnackBar(content: Text('${item.title} adicionado'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Colors.red,
          child: Icon(Icons.remove_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.removerItem(
              cartItem,
            );
            final snackBar = SnackBar(content: Text('${item.title} removido'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }

    
  }
}