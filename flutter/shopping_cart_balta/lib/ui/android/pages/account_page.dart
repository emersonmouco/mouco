import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/user_bloc.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/account/authenticated_user_card_widget.dart';
import 'package:shoppingcartbalta/ui/shared/widgets/account/unauthenticated_user_card_widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UsuarioBloc>(context);
    
    return Scaffold(
      body: bloc.usuario == null ? UnauthenticatedUserCard() : AuthenticatedUserCard(),
    );
  }
}