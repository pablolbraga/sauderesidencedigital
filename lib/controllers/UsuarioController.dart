import 'package:http/http.dart' as http;
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';

class UsuarioController{

  static Future listarDadosUsuario(String login, String senha) async{

    var url = VariaveisGlobais.linkBasico + "/ValidarLoginSenhaRetornaUsuario/" + login + "/" + senha;
    return await http.get(url);

  }

}