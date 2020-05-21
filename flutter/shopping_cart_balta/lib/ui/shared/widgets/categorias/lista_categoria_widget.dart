import 'package:flutter/widgets.dart';
import 'package:shoppingcartbalta/models/categoria/lista_categoria_model.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/categorias/categoria_card_widget.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/shared/loader_widget.dart';

class ListaCategoriaWidget extends StatelessWidget {

  final List<ListaCategoriaModel> categorias;

  ListaCategoriaWidget({@required this.categorias});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(object: categorias, callback: list),
    );
  }
  
  
  Widget list() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          ListaCategoriaModel item = categorias[index];
          
          return Padding(
              padding: EdgeInsets.all(5),
              child: CategoriaCard(item: item),
          );
        },
    );
  }
  
}
