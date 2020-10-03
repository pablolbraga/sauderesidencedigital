import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/Uteis.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/views/VisitasRealizadasPorPeriodo.dart';

class VisitasRealizadasPorPeriodoFiltro extends StatefulWidget {
  @override
  _VisitasRealizadasPorPeriodoFiltroState createState() => _VisitasRealizadasPorPeriodoFiltroState();
}

class _VisitasRealizadasPorPeriodoFiltroState extends State<VisitasRealizadasPorPeriodoFiltro> {
  TextEditingController _controllerDataInicio = TextEditingController();
  TextEditingController _controllerDataFim = TextEditingController();
  String _mensagemErro = "";

  Future<void> _selectDataInicio(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2999),
    );
    if (d != null) {
      setState(() {
        _controllerDataInicio.text = Uteis.formatarData(d.toString());
      });
    }
  }

  Future<void> _selectDataFim(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2999),
    );
    if (d != null) {
      setState(() {
        _controllerDataFim.text = Uteis.formatarData(d.toString());
      });
    }
  }

  void _validarCampos(){
    String datainicio = _controllerDataInicio.text;
    String datafim = _controllerDataFim.text;

    if (datainicio.isNotEmpty){
      if (datafim.isNotEmpty){
        setState(() {
          _mensagemErro = "";
          _acessarPesquisa();
        });
      } else {
        setState(() {
          _mensagemErro = "Data fim não informada";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Data inicio não informada";
      });
    }
  }

  void _acessarPesquisa(){
    VariaveisGlobais.datainicial = _controllerDataInicio.text;
    VariaveisGlobais.datafinal = _controllerDataFim.text;
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => VisitasRealizadasPorPeriodo()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitas Realizadas Filtro"),
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
                      readOnly: true,
                      controller: _controllerDataInicio,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Data Inicio",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                        )
                      ),
                      onTap: (){
                        _selectDataInicio(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      readOnly: true,
                      controller: _controllerDataFim,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Data Fim",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      onTap: (){
                        _selectDataFim(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: RaisedButton(
                      child: Text(
                        "Pesquisar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: () {
                        _validarCampos();
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}

