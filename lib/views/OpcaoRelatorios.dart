import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/views/Opcao.dart';
import 'package:sauderesidencedigital/views/VisitasRealizadasPorPeriodoFiltro.dart';

class OpcaoRelatorios extends StatefulWidget {
  @override
  _OpcaoRelatoriosState createState() => _OpcaoRelatoriosState();
}

class _OpcaoRelatoriosState extends State<OpcaoRelatorios> {
  void _visitasRealizadasPorPeriodo() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VisitasRealizadasPorPeriodoFiltro()));
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Opcao()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(title: Text("Opções de Relatório")),
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
                                  "Visitas Realizadas Por Período",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                color: Colors.blue,
                                padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                onPressed: () {
                                  _visitasRealizadasPorPeriodo();
                                },
                              ),
                            ),
                          ]))))),
    );
  }
}
