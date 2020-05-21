import 'package:flutter/material.dart';
import 'package:shoppingcartbalta/models/produto/produto_detalhes_model.dart';
import 'package:shoppingcartbalta/repositories/produto_repository.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/shared/progress_indicator_widget.dart';

class ProdutoPage extends StatelessWidget {
  
  final String tag;
  final _repository = new ProdutoRepository();

  ProdutoPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetalhesProdutoModel>(
      future: _repository.get(tag),
      builder: (context, snapshot){
        DetalhesProdutoModel produto = snapshot.data;

        switch (snapshot.connectionState){
          case ConnectionState.none:
            return Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIdicator(),
            );
          case ConnectionState.done:
            if(snapshot.hasError)
              return Center(
                child: Text("Não foi possível obter nenhum produto"),
              );
              return content(produto);
        }
        return null;

      },
    );
  }

  Widget content(DetalhesProdutoModel produto){
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: produto.images.length,
        itemBuilder: (BuildContext ctxt, int index){
          return Container(
            width: 200,
            child: Image.network(
              produto.images[index],
            ),
          );
        }
        ),
    );
  }

}   