import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/models/FichaPsicologiaModel.dart';

class FichaPsicologia extends StatefulWidget {
  @override
  _FichaPsicologiaState createState() => _FichaPsicologiaState();
}

class _FichaPsicologiaState extends State<FichaPsicologia> {
  String _mensagemErro = "";
  String _dataInicio;
  TextEditingController _controllerQueixaPrincipal = TextEditingController();
  TextEditingController _controllerComoComecou = TextEditingController();
  TextEditingController _controllerRepentino = TextEditingController();
  TextEditingController _controllerTransformacoes = TextEditingController();
  TextEditingController _controllerSintomas = TextEditingController();

  void _salvarFicha(){
    FichaPsicologiaModel fp = new FichaPsicologiaModel();

    fp.idadmission = VariaveisGlobais.dadosAgenda.idadmission;
    fp.datahoraini = _dataInicio;
    fp.idprofissional = VariaveisGlobais.dadosUsuario.idperson;
    fp.idespecialidade = VariaveisGlobais.dadosUsuario.especialidade;
    fp.datacriacao = _dataInicio;
    fp.nmprofissional = VariaveisGlobais.dadosUsuario.nmespecialidade;
    fp.numeroregistro = VariaveisGlobais.dadosAgenda.registroprofissional;
    fp.idprofagenda = VariaveisGlobais.dadosAgenda.idprofagenda;
    fp.queixaprincipal = _controllerQueixaPrincipal.text;
    fp.queixacomeco = _controllerComoComecou.text;
    fp.queixarepentino = _controllerRepentino.text;
    fp.queixatransformacao = _controllerTransformacoes.text;
    fp.queixasintoma = _controllerSintomas.text;
    fp.offline = 'N';
    fp.latitude = VariaveisGlobais.latitude;
    fp.longitude = VariaveisGlobais.longitude;
    VariaveisGlobais.tipoFicha = "PSI";
    VariaveisGlobais.dadosFichaPsicologia = fp;
    Navigator.pushReplacementNamed(context, 'AssinaturaPacientes');
  }

  void _validaDados(){
    String queixaPrincipal = _controllerQueixaPrincipal.text;
    String comoComecou = _controllerComoComecou.text;
    String repentino = _controllerRepentino.text;
    String transformacoes = _controllerTransformacoes.text;
    String sintomas = _controllerSintomas.text;

    if (queixaPrincipal.isNotEmpty){
      if (comoComecou.isNotEmpty){
        if (repentino.isNotEmpty){
          if (transformacoes.isNotEmpty){
            if (sintomas.isNotEmpty){
              setState(() {
                _mensagemErro = "";
                _salvarFicha();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => AssinaturaPaciente()));
              });
            } else {
              setState(() {
                _mensagemErro = "Sintomas não informado.";
              });
            }
          } else {
            setState(() {
              _mensagemErro = "Transformações não informada.";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "Não informado se foi Repentino ou Gradual.";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Não informado como começou.";
        });
      }
    } else {
      setState(() {
        setState(() {
          _mensagemErro = "Queixa Principal não informado.";
        });
      });
    }
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
      appBar: new AppBar(
        title: new Text(VariaveisGlobais.dadosAgenda.nmpaciente),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffD9EFF3)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Queixa Principal:"),
                TextField(
                  controller: _controllerQueixaPrincipal,
                  style: TextStyle(fontSize: 20),
                ),
                Text("Como Começou:"),
                TextField(
                  controller: _controllerComoComecou,
                  style: TextStyle(fontSize: 20),
                ),
                Text("Foi Repentino ou Gradual:"),
                TextField(
                  controller: _controllerRepentino,
                  style: TextStyle(fontSize: 20),
                ),
                Text("Quais Transformações Ocorreram:"),
                TextField(
                  controller: _controllerTransformacoes,
                  style: TextStyle(fontSize: 20),
                ),
                Text("Sintomas:"),
                TextField(
                  controller: _controllerSintomas,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: (){
                        setState(() {
                          _validaDados();
                        });
                      },
                    )
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
          ),
        ),
      ),
    );
  }
}
