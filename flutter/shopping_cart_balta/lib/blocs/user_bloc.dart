import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingcartbalta/configuracoes.dart';
import 'package:shoppingcartbalta/models/autenticacao/autenticar_usuario_model.dart';
import 'package:shoppingcartbalta/models/usuario/criar_usuario_model.dart';
import 'package:shoppingcartbalta/models/usuario/usuario_model.dart';
import 'package:shoppingcartbalta/repositories/account_repository.dart';

class UsuarioBloc extends ChangeNotifier{
  var usuario = new UsuarioModel();

  UsuarioBloc(){
    usuario = null;
    loadUser();
  }

  Future<UsuarioModel> authenticate(AuthenticateModel model) async {
      try{
        var preferences = await SharedPreferences.getInstance();
        var repository = new AccountRepository();

        var res = await repository.authenticate(model);

        usuario = res;
        await preferences.setString('user', jsonEncode(res));

        return res;

      }catch(e){
        usuario = null;
        return null;
      }
  }

  Future<UsuarioModel> create(CriarUsuarioModel model) async{
    try{
      var repository = new AccountRepository();
      var res = await repository.create(model);

      return res;

    }catch (e){
      usuario = null;
      return null;
    }
  }

  logout() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString('user', null);
    usuario = null;
    notifyListeners();
  }

  Future loadUser() async {
    var preferences = await SharedPreferences.getInstance();
    var userData = preferences.getString('user');
    if(userData != null){
      var result = UsuarioModel.fromJson(jsonDecode(userData));
      Configuracoes.user = result;
      usuario = result;
    }
  }

}