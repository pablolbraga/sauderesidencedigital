import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/controllers/VisitasRealizadasController.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/VisitasRealizadasModel.dart';
import 'package:sauderesidencedigital/views/OpcaoRelatorios.dart';

class VisitasRealizadasPorPeriodo extends StatefulWidget {
  @override
  _VisitasRealizadasPorPeriodoState createState() => _VisitasRealizadasPorPeriodoState();
}

class _VisitasRealizadasPorPeriodoState extends State<VisitasRealizadasPorPeriodo> {
  var listaVisitasRealizadas = new List<VisitasRealizadasModel>();
  var titulo = "Visitas Realizadas";

  _listarVisitasRealizadas() {
    VisitasRealizadasController.listarVisitasRealizadasPorPeriodo(
        VariaveisGlobais.dadosUsuario.idperson,
        VariaveisGlobais.datainicial.replaceAll("/", "-"),
        VariaveisGlobais.datafinal.replaceAll("/", "-"))
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listaVisitasRealizadas = list.map((model) => VisitasRealizadasModel.fromJson(model)).toList();
        titulo = "Visitas Realizadas " + listaVisitasRealizadas.length.toString();
      });
    });
  }

  _abrirUrl(String url) {
    if (canLaunch(url) != null){
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listarVisitasRealizadas();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpcaoRelatorios()),
    );
  }

  Future<void> _atualizarVisitasRealizadas() async {
    await Future.delayed(Duration(seconds: 2), () => _listarVisitasRealizadas());


  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              titulo,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _atualizarVisitasRealizadas,
            child: Container(
              decoration: BoxDecoration(color: Color(0xffD9EFF3)),
              padding: EdgeInsets.all(30),
              child: ListView.builder(
                  itemCount: listaVisitasRealizadas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          if (listaVisitasRealizadas[index].idtemplate == 108) // Fisio/Fono/TO
                            _abrirUrl(VariaveisGlobais.linkExterno + "mobileEspecialidade/imprimirAcompanhamentoEspecialidade2Via.php?adm=" + listaVisitasRealizadas[index].admissao.toString() + "&evol=" + listaVisitasRealizadas[index].idevolucao.toString());
                          else if (listaVisitasRealizadas[index].idtemplate == 109) // Nutricionista
                            _abrirUrl(VariaveisGlobais.linkExterno + "mobileEspecialidade/imprimirAcompanhamentoNutricionista2Via.php?adm=" + listaVisitasRealizadas[index].admissao.toString() + "&evol=" + listaVisitasRealizadas[index].idevolucao.toString());
                          else if (listaVisitasRealizadas[index].idtemplate == 110) // Psicologia
                            _abrirUrl(VariaveisGlobais.linkExterno + "mobileEspecialidade/imprimirAcompanhamentoPsicologia2Via.php?adm=" + listaVisitasRealizadas[index].admissao.toString() + "&evol=" + listaVisitasRealizadas[index].idevolucao.toString());
                        },
                        child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  listaVisitasRealizadas[index].nmpaciente,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Data Inicio: ' + listaVisitasRealizadas[index].dataini +
                                      '\nData Fim: ' + listaVisitasRealizadas[index].datafim +
                                      '\nTipo da Visita: ' + listaVisitasRealizadas[index].nmtemplate,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      color: Colors.blue,
                    );
                  }),
            ),
          ),
        ));
  }
}
