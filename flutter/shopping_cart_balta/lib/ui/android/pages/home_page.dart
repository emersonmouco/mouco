import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/home_bloc.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/categorias/lista_categoria_widget.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/produto/lista_produto_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final HomeBloc bloc = Provider.of<HomeBloc>(context);

  
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            ListaCategoriaWidget(
              categorias: bloc.categorias,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Mais vendidos",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            ListaProduto(produtos: bloc.produtos),
          ],
        ),
        ),
    );
  }
}