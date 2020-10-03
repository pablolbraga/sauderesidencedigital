import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/views/Agenda.dart';
import 'package:sauderesidencedigital/views/Login.dart';
import 'package:sauderesidencedigital/views/OpcaoRelatorios.dart';

class Opcao extends StatefulWidget {
  @override
  _OpcaoState createState() => _OpcaoState();
}

class _OpcaoState extends State<Opcao> {
  void _abrirAgenda() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Agenda()));
    });
  }

  void _abrirRelatorios() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OpcaoRelatorios()));
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(title: Text("Opções")),
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
                      child: RaisedButton(
                        child: Text(
                          "Agenda",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          _abrirAgenda();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: RaisedButton(
                        child: Text(
                          "Relatorios",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          _abrirRelatorios();
                        },
                      ),
                    ),
                  ]))))),
    );
  }
}
