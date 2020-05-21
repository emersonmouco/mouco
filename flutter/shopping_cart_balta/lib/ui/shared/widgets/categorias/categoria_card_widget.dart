import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/home_bloc.dart';
import 'package:shoppingcartbalta/configuracoes.dart';
import 'package:shoppingcartbalta/models/categoria/lista_categoria_model.dart';

class CategoriaCard extends StatelessWidget {

  final ListaCategoriaModel item;

  CategoriaCard({@required this.item});

  @override
  Widget build(BuildContext context) {

    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.categoriaSelecionada
            ? Theme.of(context).primaryColor.withOpacity(0.3)
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: FlatButton(
          onPressed: (){
            bloc.mudarCategoria(item.tag);
          },
          child: Image.asset("assets/categories/${Configuracoes.theme}/${item.tag}.png"),
      ),
    );
  }
}
