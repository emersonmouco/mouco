import 'package:shoppingcartbalta/models/carrinho/carrinho_item_model.dart';
import 'package:flutter/widgets.dart';

class CartBloc extends ChangeNotifier {
  var cart = new List<CarrinhoItemModel>();
    double total = 0;

    get(){
      return cart;
    }

    adicionarItem(CarrinhoItemModel itemCarrinho){
      cart.add(itemCarrinho);
      calcularTotal();
    }

    removerItem(CarrinhoItemModel itemCarrinho){
      cart.removeWhere((item) => item.id == itemCarrinho.id);
      calcularTotal();
    }

    itensNoCarrinho(CarrinhoItemModel itemCarrinho){
      var resultado = false;
      cart.forEach((item) {
        if(itemCarrinho.id == item.id) resultado = true;
       });
       return resultado;
    }

    aumentarQuantidade(CarrinhoItemModel item){
      if(item.quantity < 2000){
        item.quantity++;
        calcularTotal();
      }  
    }

    diminuirQuantidade(CarrinhoItemModel item){
      if(item.quantity > 1){
        item.quantity--;
        calcularTotal();
      }  
    }

    calcularTotal(){
      total = 0;
      cart.forEach((itemCarrinho) {
          total += (itemCarrinho.price * itemCarrinho.quantity);
      notifyListeners();
      });
    }
}
