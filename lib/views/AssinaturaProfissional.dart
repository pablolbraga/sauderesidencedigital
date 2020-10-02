import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:signature/signature.dart';
import 'package:http/http.dart' as http;

class AssinaturaProfissional extends StatefulWidget {
  @override
  _AssinaturaProfissionalState createState() => _AssinaturaProfissionalState();
}

class _AssinaturaProfissionalState extends State<AssinaturaProfissional> {
  String _mensagemErro = "";

  void _validaAssinatura(){
    if (_controller.isEmpty){
      setState(() {
        _mensagemErro = "Assinatura não informada.";
      });
    } else {
      setState(() {
        _mensagemErro = "";
      });
      // Enviar dados
      _enviarDados();

    }
  }

  Future<void> _showAviso() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Registro Gravado com sucesso.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'Agenda');
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> _enviarDados() async{
    try{
      String datafim = formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
      Map<String, String> headers = new Map<String, String>();
      headers["Content-type"] = "application/json";
      headers["Accept"] = "application/json";

      var dados;
      String url;
      if (VariaveisGlobais.tipoFicha == "TER"){
        VariaveisGlobais.dadosFichaTerapia.datahorafim = datafim;
        dados = VariaveisGlobais.dadosFichaTerapia.toJson();
        url = VariaveisGlobais.linkBasico + "/addfichaterapia";
      }
      else if (VariaveisGlobais.tipoFicha == "NUT"){
        VariaveisGlobais.dadosFichaNutricao.datafim = datafim;
        dados = VariaveisGlobais.dadosFichaNutricao.toJson();
        url = VariaveisGlobais.linkBasico + "/addfichanutricao";
      }
      else if (VariaveisGlobais.tipoFicha == "PSI"){
        VariaveisGlobais.dadosFichaPsicologia.datahorafim = datafim;
        dados = VariaveisGlobais.dadosFichaPsicologia.toJson();
        url = VariaveisGlobais.linkBasico + "/addfichapsicologia";
      }

      http.Response response = await http.post(Uri.encodeFull(url), body: json.encode(dados), headers: headers);
      if (response.statusCode == 200){
        setState(() {
          _showAviso();
        });
      } else {
        setState(() {
          _mensagemErro = "Erro ao enviar os dados.";
        });
      }


    } catch(error){
      setState(() {
        _mensagemErro = error.toString();
      });
    }
  }

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
          title: Text("Assinatura do Profissional"),
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
                          if (VariaveisGlobais.tipoFicha == "TER"){
                            VariaveisGlobais.dadosFichaTerapia.assinaturaprofissional = base64Encode(data);
                          }
                          else if (VariaveisGlobais.tipoFicha == "NUT"){
                            VariaveisGlobais.dadosFichaNutricao.assinatura_prof = base64Encode(data);
                          }
                          else if (VariaveisGlobais.tipoFicha == "PSI"){
                            VariaveisGlobais.dadosFichaPsicologia.assinaturaprofissional = base64Encode(data);
                          }

                          _validaAssinatura();
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
          ),
          Center(
              child: Text(
                _mensagemErro,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20
                ),
              )
          )
        ]));
  }
}
