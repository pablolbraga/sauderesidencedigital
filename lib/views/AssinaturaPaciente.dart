import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/views/AssinaturaProfissional.dart';
import 'package:signature/signature.dart';

class AssinaturaPaciente extends StatefulWidget {
  @override
  _AssinaturaPacienteState createState() => _AssinaturaPacienteState();
}

class _AssinaturaPacienteState extends State<AssinaturaPaciente> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Assinatura do Paciente"),
        ),
        body: ListView(children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xffD9EFF3)),
            height: 150,
          ),
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.lightBlueAccent,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.check),
                      color: Colors.blue,
                      onPressed: () async {
                        if (_controller.isNotEmpty) {
                          var data = await _controller.toPngBytes();
                          VariaveisGlobais.dadosFichaTerapia
                              .assinaturapaciente = base64Encode(data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AssinaturaProfissional()));
                        }
                      }),
                  IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                        });
                      })
                ]),
          )
        ]));
  }
}
