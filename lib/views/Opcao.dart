import 'package:flutter/material.dart';

class Opcao extends StatefulWidget {
  @override
  _OpcaoState createState() => _OpcaoState();
}

class _OpcaoState extends State<Opcao> {
  void _abrirAgenda(){

  }

  void _abrirRelatorios(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opções")
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
              ]
            )
          )
        )
      ),
    );
  }
}