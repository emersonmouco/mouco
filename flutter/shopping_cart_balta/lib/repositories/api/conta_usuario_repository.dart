import 'package:dio/dio.dart';
import 'package:shoppingcartbalta/configuracoes.dart';
import 'package:shoppingcartbalta/models/autenticacao/autenticar_usuario_model.dart';
import 'package:shoppingcartbalta/models/usuario/criar_usuario_model.dart';
import 'package:shoppingcartbalta/models/usuario/usuario_model.dart';

class ContaUsuarioRepository {
  Future<UsuarioModel> authenticate(AuthenticateModel model) async {
    var url = "${Configuracoes.apiUrl}v1/account/login";
    Response response = await Dio().post(url, data: model);
    return UsuarioModel.fromJson(response.data);
  }

  Future<UsuarioModel> create(CriarUsuarioModel model) async {
    var url = "${Configuracoes.apiUrl}v1/account";
    Response response = await Dio().post(url, data: model);
    return UsuarioModel.fromJson(response.data);
  }

}