import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';

class UsuarioController{

  static Future listarDadosUsuario(String login, String senha) async{

    var url = VariaveisGlobais.linkBasico + "/ValidarLoginSenhaRetornaUsuario/" + login + "/" + senha;
    return await http.get(url);

  }

  static Future esqueceuSenha(String login) async {
    var url = VariaveisGlobais.linkBasico + "/EsqueceuSenha/" + login;
    return await http.get(url);
  }

  static Future alterarSenha(int codigo, String senha) async {
    var url = VariaveisGlobais.linkBasico + "/AlterarSenha/" + codigo.toString() + "/" + senha;
    return await http.get(url);
  }

}