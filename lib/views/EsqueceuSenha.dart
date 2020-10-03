import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/controllers/UsuarioController.dart';
import 'package:sauderesidencedigital/views/Login.dart';

class EsqueceuSenha extends StatefulWidget {
  @override
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  TextEditingController _controllerLogin = TextEditingController();
  String _mensagemErro = "";

  void _validarCampos(){
    String login = _controllerLogin.text;

    if (login.isNotEmpty) {
      setState(() {
        _mensagemErro = "";
        _enviarEmail();
      });
    } else {
      setState(() {
        _mensagemErro = "Login não informado";
      });
    }
  }

  void _enviarEmail(){
    UsuarioController.esqueceuSenha(_controllerLogin.text).then(
        (response){
          String valor = json.decode(response.body);
          if (valor == "true"){
            setState(() {
              _mensagemErro = "";
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login()));
            });
          } else {
            _mensagemErro = "Login não encontrado.";
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Esqueceu a Senha"),
        ),
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
                      controller: _controllerLogin,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Informe seu login",
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
                    child: RaisedButton(
                      child: Text(
                        "Enviar Solicitação",
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
