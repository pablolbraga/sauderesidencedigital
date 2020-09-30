import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/FichaTerapiaModel.dart';
import 'package:sauderesidencedigital/views/AssinaturaPaciente.dart';

class FichaTerapia extends StatefulWidget {
  @override
  _FichaTerapiaState createState() => _FichaTerapiaState();
}

class _FichaTerapiaState extends State<FichaTerapia> {
  TextEditingController _controllerEvolucao = TextEditingController();
  String _mensagemErro = "";
  String _participacaoValor;
  String _dataInicio;
  List _listaParticipacao = ["NÃO INFORMADA", "ATIVO", "ATIVO ASSISTIDO", "PASSIVO", "NÃO REALIZADA"];
  String _execucaoValor;
  List _listaExecucao = ["NÃO INFORMADA", "COMPLETA", "PARCIAL", "MINIMA", "NÃO REALIZADA"];

  void _validaDados(){
    if (_participacaoValor != null){
      if (_execucaoValor != null){
        if(_controllerEvolucao.text.isNotEmpty){
          setState(() {
            _enviarDados();
          });
        } else {
          setState(() {
            _mensagemErro = "Evolução não informada.";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Execução de Técnicas não informada";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Participação não selecionada.";
      });
    }
  }

  void _enviarDados(){
    FichaTerapiaModel ft = new FichaTerapiaModel();
    ft.idadmission = VariaveisGlobais.dadosAgenda.idadmission;
    ft.datahoraini = _dataInicio;
    ft.datahorafim = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    ft.participacaocliente = _participacaoValor;
    ft.execucaotecnicaproposta = _execucaoValor;
    ft.observacao = _controllerEvolucao.text;
    ft.idprofissional = VariaveisGlobais.dadosUsuario.idperson;
    ft.idespecialidade = VariaveisGlobais.dadosUsuario.especialidade;
    ft.datacriacao = _dataInicio;
    ft.nmprofissional = VariaveisGlobais.dadosUsuario.nome;
    ft.apelido = VariaveisGlobais.dadosUsuario.apelido;
    ft.nmespecialidade = VariaveisGlobais.dadosUsuario.nmespecialidade;
    ft.numeroregistro = VariaveisGlobais.dadosAgenda.registroprofissional;
    ft.idprofagenda = VariaveisGlobais.dadosAgenda.idprofagenda;
    setState(() {
      VariaveisGlobais.dadosFichaTerapia = ft;
      Navigator.push(context, MaterialPageRoute(builder: (context) => AssinaturaPaciente()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _dataInicio = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ficha de Terapia: " + VariaveisGlobais.dadosAgenda.nmpaciente),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xffD9EFF3)),
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Participação do Cliente",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              DropdownButton(
                hint: Text(
                  "Selecione uma Opção",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue
                ),
                value: _participacaoValor,
                onChanged: (value){
                  setState(() {
                    _participacaoValor = value;
                  });
                },
                items: _listaParticipacao.map((value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              Text(""),
              Text(
                "Execução de Técnicas Propostas",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              DropdownButton(
                hint: Text(
                  "Selecione uma Opção",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue
                ),
                value: _execucaoValor,
                onChanged: (value){
                  setState(() {
                    _execucaoValor = value;
                  });
                },
                items: _listaExecucao.map((value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              Text(""),
              Text(
                "Evolução",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              TextField(
                controller: _controllerEvolucao,
                keyboardType: TextInputType.multiline,
                minLines: 1,//Normal textInputField will be displayed
                maxLines: 5,// when user presses enter it will adapt to it
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                  child: Text(
                    "Gravar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: (){
                    _validaDados();
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
        ));
  }
}
