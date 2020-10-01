import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sauderesidencedigital/controllers/AgendaController.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/AgendaModel.dart';
import 'package:sauderesidencedigital/views/FichaTerapia.dart';
import 'package:sauderesidencedigital/views/Opcao.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  var agendas = new List<AgendaModel>();
  Position _currentPosition;
  String _mensagemErro = "";

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

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Opcao()),
    );
  }

  Future<void> _atualizarAgenda() async {
    await Future.delayed(Duration(seconds: 2), () => _listarAgenda());
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      setState(() {
        _mensagemErro = "NÃO ENCONTRADO A LOCALIZAÇÃO";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Agenda de " + VariaveisGlobais.dadosUsuario.nome,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _atualizarAgenda,
            child: Container(
              decoration: BoxDecoration(color: Color(0xffD9EFF3)),
              padding: EdgeInsets.all(30),
              child: ListView.builder(
                  itemCount: agendas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          VariaveisGlobais.dadosAgenda = agendas[index];
                          VariaveisGlobais.latitude = _currentPosition.latitude.toString();
                          VariaveisGlobais.longitude = _currentPosition.longitude.toString();
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FichaTerapia()));
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
            ),
          ),
        ));
  }
}
