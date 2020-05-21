
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/cart_bloc.dart';
import 'package:shoppingcartbalta/models/carrinho/carrinho_item_model.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/cart/cart_item_widget.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/shared/loader_widget.dart';

class CartPage extends StatelessWidget {
  var bloc;
  final price = new NumberFormat("#,##0.00", "pt_BR");
  var itens = new List<CarrinhoItemModel>();
  

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    itens = bloc.cart;
  
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Loader(
                object: bloc.cart, 
                callback: list,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "R\$ ${price.format(bloc.total)}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  FlatButton(
                    child: Text("Checkout"),
                    color: Theme.of(context).primaryColor,  
                    onPressed: (){}, 
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: itens[index],
          ),
          key: Key(itens[index].id),
          onDismissed: (direction){
            bloc.remove(itens[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}

