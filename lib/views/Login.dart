import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/controllers/UsuarioController.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/UsuarioModel.dart';
import 'package:sauderesidencedigital/views/Opcao.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  var usuarios = new List<UsuarioModel>();
  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _validarCampos(){
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    if (login.isNotEmpty) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
          _acessarSistema();
        });
      } else {
        setState(() {
          _mensagemErro = "Senha não informada";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Login não informado";
      });
    }
  }

  void _acessarSistema(){
    UsuarioController.listarDadosUsuario(
        _controllerLogin.text, _controllerSenha.text)
        .then((response) {
      Iterable lista = json.decode(response.body);
      usuarios = lista.map((model) => UsuarioModel.fromJson(model)).toList();
      if (usuarios.length > 0) {
        VariaveisGlobais.dadosUsuario = usuarios[0];
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Opcao()));
        });
      } else {
        setState(() {
          _mensagemErro = "Login e/ou senha incorreto(s)";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color(0xffD9EFF3)),
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset("images/LogoNovaTransparente.png", width: 300, height: 250,),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _controllerLogin,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Informe o login",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      obscureText: _isHidden,
                      controller: _controllerSenha,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Informe a senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: (){
                            _toggleVisibility();
                          },
                          icon: Icon(_isHidden == true ? Icons.visibility_off : Icons.visibility),
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: RaisedButton(
                      child: Text(
                        "Acessar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        _validarCampos();
                      },
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(
                        "Esqueceu a senha? Clique aqui",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
