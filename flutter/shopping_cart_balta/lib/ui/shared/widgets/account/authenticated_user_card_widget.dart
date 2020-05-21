import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/user_bloc.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UsuarioBloc>(context);
    
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(bloc.usuario.image),
                  ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text("Sair"),
              onPressed: bloc.logout(), 
              ),
          ],
        ),
      ),
    );
  }
}