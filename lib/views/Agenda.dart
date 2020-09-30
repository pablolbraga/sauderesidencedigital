import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/controllers/AgendaController.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/AgendaModel.dart';
import 'package:sauderesidencedigital/views/FichaTerapia.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  var agendas = new List<AgendaModel>();

  _listarAgenda() {
    AgendaController.listarAgendaProfissional(
            VariaveisGlobais.dadosUsuario.idperson)
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        agendas = list.map((model) => AgendaModel.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listarAgenda();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Agenda de " + VariaveisGlobais.dadosUsuario.nome,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xffD9EFF3)),
          padding: EdgeInsets.all(30),
          child: ListView.builder(
              itemCount: agendas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: (){
                      VariaveisGlobais.dadosAgenda = agendas[index];

                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FichaTerapia()));
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              agendas[index].nmpaciente,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              agendas[index].nmconvenio,
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
        ));
  }
}
