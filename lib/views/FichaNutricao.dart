import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:sauderesidencedigital/lists/Listas.dart';
import 'package:sauderesidencedigital/models/FichaNutricaoModel.dart';

class FichaNutricao extends StatefulWidget {
  @override
  _FichaNutricaoState createState() => _FichaNutricaoState();
}

class _FichaNutricaoState extends State<FichaNutricao> {
  String _mensagemErro = "";
  var _dataInicio;

  bool _selHAS = false;
  bool _selDiabetes = false;
  bool _selDislipidemia = false;
  bool _selImobilidade = false;
  bool _selObesidade = false;
  bool _selDesnutricao = false;
  bool _selEntupimentoSonda = false;
  bool _selAvalSubjetivaSintomaDiarreia = false;
  bool _selAvalSubjetivaSintomaHiporexia = false;
  bool _selAvalSubjetivaSintomaConstipacao = false;

  TextEditingController _ctrAvalSubjetivaRitmoIntestinal =
  TextEditingController();
  TextEditingController _ctrConduta = TextEditingController();
  TextEditingController _ctrAcompanhante = TextEditingController();
  TextEditingController _ctrOutrosGrupos = TextEditingController();
  TextEditingController _ctrOutrosTipoNutricaoEnteral = TextEditingController();
  TextEditingController _ctrDietaIndustManipQtde = TextEditingController();
  TextEditingController _ctrDietaIndustManipDesc = TextEditingController();
  TextEditingController _ctrDietaIndustProntaQtde = TextEditingController();
  TextEditingController _ctrDietaIndustProntaDesc = TextEditingController();
  TextEditingController _ctrDietaIndustProntaFabricante = TextEditingController();
  TextEditingController _ctrAvalSubjetivaPesoQtde = TextEditingController();
  TextEditingController _ctrAvalSubjetivaPesoTempo = TextEditingController();
  TextEditingController _ctrOutrosSintomas = TextEditingController();
  TextEditingController _ctrAvalAntroAJ = TextEditingController();
  TextEditingController _ctrAvalAntroPesoAtual = TextEditingController();
  TextEditingController _ctrAvalAntroCircAbdominal = TextEditingController();
  TextEditingController _ctrAvalAntroIMC = TextEditingController();
  TextEditingController _ctrAvalAntroCP = TextEditingController();
  TextEditingController _ctrAvalAntroIdade = TextEditingController();
  TextEditingController _ctrAvalAntroDCT = TextEditingController();
  TextEditingController _ctrAvalAntroCB = TextEditingController();
  TextEditingController _ctrAvalAntroCMB = TextEditingController();
  TextEditingController _ctrAvalAntroAltura = TextEditingController();
  TextEditingController _ctrDiagnosticoNutricional = TextEditingController();

  List<TipoNutricao> _tiponutricao = TipoNutricao.getTipoNutricao();
  List<DropdownMenuItem<TipoNutricao>> _ddmiTipoNutricao;
  TipoNutricao _selTipoNutricao;

  List<TipoNutricaoEnteral> _tiponutricaoenteral =
  TipoNutricaoEnteral.getTipoNutricaoEnteral();
  List<DropdownMenuItem<TipoNutricaoEnteral>> _ddmiTipoNutricaoEnteral;
  TipoNutricaoEnteral _selTipoNutricaoEnteral;

  List<TipoDietaEnteral> _tipodietaenteral =
  TipoDietaEnteral.getTipoDietaEnteral();
  List<DropdownMenuItem<TipoDietaEnteral>> _ddmiTipoDietaEnteral;
  TipoDietaEnteral _selTipoDietaEnteral;

  List<TipoDietaIndustrializada> _tipodietaindustrializada =
  TipoDietaIndustrializada.getTipoDietaIndustrializada();
  List<DropdownMenuItem<TipoDietaIndustrializada>>
  _ddmiTipoDietaIndustrializada;
  TipoDietaIndustrializada _selTipoDietaIndustrializada;

  List<FornecedorDietaIndustrializada> _fornecedordietaindustrializada =
  FornecedorDietaIndustrializada.getFornecedorDietaIndustrializada();
  List<DropdownMenuItem<FornecedorDietaIndustrializada>>
  _ddmiFornecedorDietaIndustrializada;
  FornecedorDietaIndustrializada _selFornecedorDietaIndustrializada;

  List<AvalSubjetivaIngesta> _avalsubjetivaingesta =
  AvalSubjetivaIngesta.getAvalSubjetivaIngesta();
  List<DropdownMenuItem<AvalSubjetivaIngesta>> _ddmiAvalSubjetivaIngesta;
  AvalSubjetivaIngesta _selAvalSubjetivaIngesta;

  List<AvalSubjetivaPeso> _avalsubjetivapeso =
  AvalSubjetivaPeso.getAvalSubjetivaPeso();
  List<DropdownMenuItem<AvalSubjetivaPeso>> _ddmiAvalSubjetivaPeso;
  AvalSubjetivaPeso _selAvalSubjetivaPeso;

  List<DiagNutricionalAbaixo65> _diagnutricionalabaixo65 =
  DiagNutricionalAbaixo65.getDiagNutricionalAbaixo65();
  List<DropdownMenuItem<DiagNutricionalAbaixo65>> _ddmiDiagNutricionalAbaixo65;
  DiagNutricionalAbaixo65 _selDiagNutricionalAbaixo65;

  List<DiagNutricionalAcima65> _diagnutricionalacima65 =
  DiagNutricionalAcima65.getDiagNutricionalAcima65();
  List<DropdownMenuItem<DiagNutricionalAcima65>> _ddmiDiagNutricionalAcima65;
  DiagNutricionalAcima65 _selDiagNutricionalAcima65;

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
        title: new Text("Ficha de Nutrição"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffD9EFF3)),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: "Acompanhante",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text("Grupo", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              new Row(
                children: <Widget>[
                  Checkbox(
                    onChanged: (bool resp){
                      setState(() {
                        _selHAS = resp;
                      });
                    },
                    value: _selHAS,
                  ),
                  Text("HAS"),
                  Checkbox(
                    onChanged: (bool resp){
                      setState(() {
                        _selDiabetes = resp;
                      });
                    },
                    value: _selDiabetes,
                  ),
                  Text("Diabetes")
                ],
              ),
              new Row(
                  children: <Widget>[
                    Checkbox(
                        value: _selDislipidemia,
                        onChanged: (bool resp) {
                          setState(() {
                            _selDislipidemia = resp;
                          });
                        }),
                    Text("Dislipidemia"),
                    Checkbox(
                        value: _selImobilidade,
                        onChanged: (bool resp) {
                          setState(() {
                            _selImobilidade = resp;
                          });
                        }),
                    Text("Imobilidade"),
                  ]
              ),
              new Row(
                children: <Widget>[
                  Checkbox(
                      value: _selObesidade,
                      onChanged: (bool resp) {
                        setState(() {
                          _selObesidade = resp;
                        });
                      }),
                  Text("Obsesidade"),
                  Checkbox(
                      value: _selDesnutricao,
                      onChanged: (bool resp) {
                        setState(() {
                          _selDesnutricao = resp;
                        });
                      }),
                  Text("Desnutrição")
                ],
              ),
              TextField(
                  controller: _ctrOutrosGrupos,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Outros Grupos",
                    filled: true,
                    fillColor: Colors.white,
                  )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Nutrição", style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ),
              new Row(
                children: <Widget>[
                  Text("Tipo:  "),
                  DropdownButton(
                    value: _selTipoNutricao,
                    items: _ddmiTipoNutricao,
                    onChanged: onChangeTipoNutricao,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("Se Enteral:  "),
                  DropdownButton(
                    value: _selTipoNutricaoEnteral,
                    items: _ddmiTipoNutricaoEnteral,
                    onChanged: onChangeTipoNutricaoEnteral,
                  ),
                ],
              ),
              TextField(
                  controller: _ctrOutrosTipoNutricaoEnteral,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Outros tipos de nutrição enteral",
                    filled: true,
                    fillColor: Colors.white,
                  )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Dieta Enteral",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  Text("Tipo:  "),
                  DropdownButton(
                    value: _selTipoDietaEnteral,
                    items: _ddmiTipoDietaEnteral,
                    onChanged: onChangeTipoDietaEnteral,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Checkbox(
                      value: _selEntupimentoSonda,
                      onChanged: (bool resp) {
                        setState(() {
                          _selEntupimentoSonda = resp;
                        });
                      }),
                  Text("Entupimento de Sonda"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff4682b4)),
                  child: Text(
                    "Dieta Industrializada",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  Text("Tipo:  "),
                  DropdownButton(
                    value: _selTipoDietaIndustrializada,
                    items: _ddmiTipoDietaIndustrializada,
                    onChanged: onChangeTipoDietaIndustrializada,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("Fornecedor:  "),
                  DropdownButton(
                    value: _selFornecedorDietaIndustrializada,
                    items: _ddmiFornecedorDietaIndustrializada,
                    onChanged: onChangeFornecedorDietaIndustrializada,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff4682b4)),
                  child: Text(
                    "Manipulada em Domicilio",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                  controller: _ctrDietaIndustManipQtde,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Necessidade Energética (kcal)",
                    filled: true,
                    fillColor: Colors.white,
                  )
              ),
              TextField(
                  controller: _ctrDietaIndustManipDesc,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff4682b4)),
                  child: Text(
                    "Pronta",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                  controller: _ctrDietaIndustProntaQtde,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Kcal/Dia",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrDietaIndustProntaDesc,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrDietaIndustProntaFabricante,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Fabricante",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Avaliação Subjetiva",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  Text("Ingesta:  "),
                  DropdownButton(
                    value: _selAvalSubjetivaIngesta,
                    items: _ddmiAvalSubjetivaIngesta,
                    onChanged: onChangeAvalSubjetivaIngesta,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("Peso:  "),
                  DropdownButton(
                    value: _selAvalSubjetivaPeso,
                    items: _ddmiAvalSubjetivaPeso,
                    onChanged: onChangeAvalSubjetivaPeso,
                  ),
                ],
              ),
              TextField(
                  controller: _ctrAvalSubjetivaPesoQtde,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Kg",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalSubjetivaPesoTempo,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Dias",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Text("Sintomas:"),
              new Row(
                children: <Widget>[
                  Checkbox(
                    onChanged: (bool resp) {
                      setState(() {
                        _selAvalSubjetivaSintomaDiarreia = resp;
                      });
                    },
                    value: _selAvalSubjetivaSintomaDiarreia,
                  ),
                  Text("Diarréia"),
                  Checkbox(
                      value: _selAvalSubjetivaSintomaHiporexia,
                      onChanged: (bool resp) {
                        setState(() {
                          _selAvalSubjetivaSintomaHiporexia = resp;
                        });
                      }),
                  Text("Hiporexia"),
                  Checkbox(
                      value: _selAvalSubjetivaSintomaConstipacao,
                      onChanged: (bool resp) {
                        setState(() {
                          _selAvalSubjetivaSintomaConstipacao = resp;
                        });
                      }),
                  Text("Constipação")
                ],
              ),
              TextField(
                  controller: _ctrOutrosSintomas,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Outros Sintomas",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalSubjetivaRitmoIntestinal,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Ritmo Intestinal",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Avaliação Antropométrica",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                  controller: _ctrAvalAntroAJ,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "AJ",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroPesoAtual,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Peso Atual",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroCircAbdominal,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Circunferência Abdominal",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroIMC,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "IMC",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroCP,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "CP (cm)",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroIdade,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Idade",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroDCT,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "DCT (mm)",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroCB,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "CB (cm)",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroCMB,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "CMB (cm)",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              TextField(
                  controller: _ctrAvalAntroAltura,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Altura (m)",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Diagnóstico Nutricional",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  Text("Abaixo de 65 Anos:  "),
                  DropdownButton(
                    value: _selDiagNutricionalAbaixo65,
                    items: _ddmiDiagNutricionalAbaixo65,
                    onChanged: onChangeDiagNutricionalAbaixo65,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("Acima de 65 Anos:  "),
                  DropdownButton(
                    value: _selDiagNutricionalAcima65,
                    items: _ddmiDiagNutricionalAcima65,
                    onChanged: onChangeDiagNutricionalAcima65,
                  ),
                ],
              ),
              TextField(
                  controller: _ctrDiagnosticoNutricional,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Descrição do Diagnóstico Nutricional",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff054f77)),
                  child: Text(
                    "Condutas",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                  controller: _ctrConduta,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: "Condutas",
                    filled: true,
                    fillColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Color(0xff303F9F),
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      _validaDados();
                    }),
              ),
              Center(
                child: Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onChangeTipoNutricao(TipoNutricao value) {
    setState(() {
      _selTipoNutricao = value;
    });
  }

  void onChangeTipoNutricaoEnteral(TipoNutricaoEnteral value) {
    setState(() {
      _selTipoNutricaoEnteral = value;
    });
  }

  void onChangeTipoDietaEnteral(TipoDietaEnteral value) {
    setState(() {
      _selTipoDietaEnteral = value;
    });
  }

  void onChangeTipoDietaIndustrializada(TipoDietaIndustrializada value) {
    setState(() {
      _selTipoDietaIndustrializada = value;
    });
  }

  void onChangeFornecedorDietaIndustrializada(
      FornecedorDietaIndustrializada value) {
    setState(() {
      _selFornecedorDietaIndustrializada = value;
    });
  }

  void onChangeAvalSubjetivaIngesta(AvalSubjetivaIngesta value) {
    setState(() {
      _selAvalSubjetivaIngesta = value;
    });
  }

  void onChangeAvalSubjetivaPeso(AvalSubjetivaPeso value) {
    setState(() {
      _selAvalSubjetivaPeso = value;
    });
  }

  void onChangeDiagNutricionalAbaixo65(DiagNutricionalAbaixo65 value) {
    setState(() {
      _selDiagNutricionalAbaixo65 = value;
    });
  }

  void onChangeDiagNutricionalAcima65(DiagNutricionalAcima65 value) {
    setState(() {
      _selDiagNutricionalAcima65 = value;
    });
  }

  void _validaDados() {
    if (_selTipoNutricao.id == 0) {
      setState(() {
        _mensagemErro = "Tipo de Nutrição não Informada.";
      });
    } else if (_selTipoNutricao.id > 1 && _selTipoNutricaoEnteral.id == 0) {
      setState(() {
        _mensagemErro = "Tipo de Nutrição Enteral não Informada.";
      });
    } else if (_selTipoDietaEnteral.id == 0) {
      setState(() {
        _mensagemErro = "Tipo de Nutrição Enteral não Informada.";
      });
    } else if (_selTipoDietaEnteral.id > 2 &&
        _selTipoDietaIndustrializada.id == 0) {
      setState(() {
        _mensagemErro = "Tipo de Dieta Industrializada não Informada.";
      });
    } else if (_selAvalSubjetivaIngesta.id == 0) {
      setState(() {
        _mensagemErro = "Ingesta não selecionada";
      });
    } else if (_selAvalSubjetivaPeso.id == 0) {
      setState(() {
        _mensagemErro = "Peso não selecionado";
      });
    } else if (_ctrAvalSubjetivaRitmoIntestinal.text == "") {
      setState(() {
        _mensagemErro = "Ritmo Intestinal não informado";
      });
    } else if (VariaveisGlobais.dadosAgenda.idade <= 65 &&
        _selDiagNutricionalAbaixo65.id == 0) {
      setState(() {
        _mensagemErro =
        "Diagnóstico Nutricional abaixo de 65 anos não informado";
      });
    } else if (VariaveisGlobais.dadosAgenda.idade > 65 &&
        _selDiagNutricionalAcima65.id == 0) {
      setState(() {
        _mensagemErro =
        "Diagnóstico Nutricional acima de 65 anos não informado";
      });
    } else if (_ctrConduta.text == "") {
      setState(() {
        _mensagemErro = "Conduta não informada";
      });
    } else {
      setState(() {
        _mensagemErro = "";
      });
      gravarDados();
    }
  }

  void gravarDados() {
    FichaNutricaoModel fn = new FichaNutricaoModel();

    fn.idadmission = VariaveisGlobais.dadosAgenda.idadmission;
    fn.datacad = _dataInicio;
    fn.datainicio = _dataInicio;
    fn.idprofessional = VariaveisGlobais.dadosUsuario.idperson;
    fn.idespecialidade = VariaveisGlobais.dadosUsuario.especialidade;
    fn.idprofagenda = VariaveisGlobais.dadosAgenda.idprofagenda;
    fn.acompanhante = _ctrAcompanhante.text;
    if (_selHAS) fn.grupohas = "S"; else fn.grupohas = "N";
    if (_selDiabetes) fn.grupodiabetes = "S"; else fn.grupodiabetes = "N";
    if (_selDislipidemia) fn.grupodislipidemia = "S"; else fn.grupodislipidemia = "N";
    if (_selImobilidade) fn.grupoimobilidade = "S"; else fn.grupoimobilidade = "N";
    if (_selObesidade) fn.grupoobesidade = "S"; else fn.grupoobesidade = "N";
    if (_selDesnutricao) fn.grupodesnutricao = "S"; else fn.grupodesnutricao = "N";
    fn.grupooutros = _ctrOutrosGrupos.text;
    fn.nutricao = _selTipoNutricao.id;
    fn.nutricaotipoenteral = _selTipoNutricaoEnteral.id;
    fn.nutricaotipoenteraloutros = _ctrOutrosTipoNutricaoEnteral.text;
    fn.dietaenteral = _selTipoDietaEnteral.id;
    if (_selEntupimentoSonda) fn.dietaenteralentupimento = "S"; else fn.dietaenteralentupimento = "N";
    fn.dietaindustipo = _selTipoDietaIndustrializada.id;
    fn.dietaindustmanipqtde = _ctrDietaIndustManipQtde.text;
    fn.dietaindustmanipdesc = _ctrDietaIndustManipDesc.text;
    fn.dietaindustprontaqtde = _ctrDietaIndustProntaQtde.text;
    fn.dietaindustprontadesc = _ctrDietaIndustProntaDesc.text;
    fn.dietaindustprontafab = _ctrDietaIndustProntaFabricante.text;
    fn.dietaindustfornecedor = _selFornecedorDietaIndustrializada.id;
    fn.avalsubjingesta = _selAvalSubjetivaIngesta.id;
    fn.avalsubjpesotipo = _selAvalSubjetivaPeso.id;
    fn.avalsubjpesoqtde = _ctrAvalSubjetivaPesoQtde.text;
    fn.avalsubjpesotempo = _ctrAvalSubjetivaPesoTempo.text;
    if (_selAvalSubjetivaSintomaDiarreia) fn.avalsubjsintomadiarreia = "S"; else fn.avalsubjsintomadiarreia = "N";
    if (_selAvalSubjetivaSintomaHiporexia) fn.avalsubjsintomahiporexia = "S"; else fn.avalsubjsintomahiporexia = "N";
    if (_selAvalSubjetivaSintomaConstipacao) fn.avalsubjsintomaconstipacao = "S"; else fn.avalsubjsintomaconstipacao = "N";
    fn.avalsubjsintomaoutros = _ctrOutrosSintomas.text;
    fn.avalsubjritmointestinal = _ctrAvalSubjetivaRitmoIntestinal.text;
    fn.avalantroaj = _ctrAvalAntroAJ.text;
    fn.avalantropeso = _ctrAvalAntroPesoAtual.text;
    fn.avalantrocircabd = _ctrAvalAntroCircAbdominal.text;
    fn.avalantroimc = _ctrAvalAntroIMC.text;
    fn.avalantrocp = _ctrAvalAntroCP.text;
    fn.avalantroidade = _ctrAvalAntroIdade.text;
    fn.avalantrocb = _ctrAvalAntroCB.text;
    fn.avalantrocmb = _ctrAvalAntroCMB.text;
    fn.avalantroaltura = _ctrAvalAntroAltura.text;
    fn.diagnutriabaixo65 = _selDiagNutricionalAbaixo65.id;
    fn.diagnutriacima65 = _selDiagNutricionalAcima65.id;
    fn.diagnutridesc = _ctrDiagnosticoNutricional.text;
    fn.conduta = _ctrConduta.text;
    fn.latitude = VariaveisGlobais.latitude;
    fn.longitude = VariaveisGlobais.longitude;
    VariaveisGlobais.tipoFicha = "NUT";
    VariaveisGlobais.dadosFichaNutricao = fn;
    Navigator.pushReplacementNamed(context, 'AssinaturaPacientes');

  }
}
