import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/controllers/UsuarioController.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/UsuarioModel.dart';
import 'package:sauderesidencedigital/views/EsqueceuSenha.dart';
import 'package:sauderesidencedigital/views/Login.dart';
import 'package:sauderesidencedigital/views/Opcao.dart';

class AlterarSenhaPrimeiroAcesso extends StatefulWidget {
  @override
  _AlterarSenhaPrimeiroAcessoState createState() => _AlterarSenhaPrimeiroAcessoState();
}

class _AlterarSenhaPrimeiroAcessoState extends State<AlterarSenhaPrimeiroAcesso> {
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerConfirmarSenha = TextEditingController();
  String _mensagemErro = "";
  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _validarCampos(){
    String senha = _controllerSenha.text;
    String confirmarSenha = _controllerConfirmarSenha.text;

    if (senha.isNotEmpty) {
      if (confirmarSenha.isNotEmpty) {
        if (senha == confirmarSenha){
          setState(() {
            _mensagemErro = "";
            _acessarSistema();
          });
        } else {
          setState(() {
            _mensagemErro = "Senhas estão diferentes";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Confirmar Senha";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Senha não informado";
      });
    }
  }

  void _acessarSistema(){
    UsuarioController.alterarSenha(
        VariaveisGlobais.dadosUsuario.codigo, _controllerSenha.text)
        .then((response) {
      String valor = json.decode(response.body);
      if (valor == "true"){
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()));
        });
      } else {
        setState(() {
          _mensagemErro = "Erro em alterar a senha";
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
                    child: TextField(
                      obscureText: _isHidden,
                      controller: _controllerConfirmarSenha,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Informe a confirmação de senha",
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
