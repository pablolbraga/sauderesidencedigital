class FichaNutricaoModel{

  int codigo;
  int idadmission;
  String datacad;
  String datainicio;
  String datafim;
  int idprofessional;
  int idespecialidade;
  int idprofagenda;
  String assinatura_pac;
  String assinatura_prof;
  String acompanhante;
  String grupohas;
  String grupodiabetes;
  String grupodislipidemia;
  String grupoimobilidade;
  String grupoobesidade;
  String grupodesnutricao;
  String grupooutros;
  int nutricao;
  int nutricaotipoenteral;
  String nutricaotipoenteraloutros;
  int dietaenteral;
  String dietaenteralentupimento;
  int dietaindustipo;
  String dietaindustmanipqtde;
  String dietaindustmanipdesc;
  String dietaindustprontaqtde;
  String dietaindustprontadesc;
  String dietaindustprontafab;
  int dietaindustfornecedor;
  int avalsubjingesta;
  int avalsubjpesotipo;
  String avalsubjpesoqtde;
  String avalsubjpesotempo;
  String avalsubjsintomadiarreia;
  String avalsubjsintomahiporexia;
  String avalsubjsintomaconstipacao;
  String avalsubjsintomaoutros;
  String avalsubjritmointestinal;
  String avalantroaj;
  String avalantropeso;
  String avalantrocircabd;
  String avalantroimc;
  String avalantrocp;
  String avalantroidade;
  String avalantrodct;
  String avalantrocb;
  String avalantrocmb;
  String avalantroaltura;
  int diagnutriabaixo65;
  int diagnutriacima65;
  String diagnutridesc;
  String conduta;
  String latitude;
  String longitude;
  String offline;

  FichaNutricaoModel({
    this.codigo,
    this.idadmission,
    this.datacad,
    this.datainicio,
    this.datafim,
    this.idprofessional,
    this.idespecialidade,
    this.idprofagenda,
    this.assinatura_pac,
    this.assinatura_prof,
    this.acompanhante,
    this.grupohas,
    this.grupodiabetes,
    this.grupodislipidemia,
    this.grupoimobilidade,
    this.grupoobesidade,
    this.grupodesnutricao,
    this.grupooutros,
    this.nutricao,
    this.nutricaotipoenteral,
    this.nutricaotipoenteraloutros,
    this.dietaenteral,
    this.dietaenteralentupimento,
    this.dietaindustipo,
    this.dietaindustmanipqtde,
    this.dietaindustmanipdesc,
    this.dietaindustprontaqtde,
    this.dietaindustprontadesc,
    this.dietaindustprontafab,
    this.dietaindustfornecedor,
    this.avalsubjingesta,
    this.avalsubjpesotipo,
    this.avalsubjpesoqtde,
    this.avalsubjpesotempo,
    this.avalsubjsintomadiarreia,
    this.avalsubjsintomahiporexia,
    this.avalsubjsintomaconstipacao,
    this.avalsubjsintomaoutros,
    this.avalsubjritmointestinal,
    this.avalantroaj,
    this.avalantropeso,
    this.avalantrocircabd,
    this.avalantroimc,
    this.avalantrocp,
    this.avalantroidade,
    this.avalantrodct,
    this.avalantrocb,
    this.avalantrocmb,
    this.avalantroaltura,
    this.diagnutriabaixo65,
    this.diagnutriacima65,
    this.diagnutridesc,
    this.conduta,
    this.latitude,
    this.longitude,
    this.offline
  });

  Map<String, dynamic> toJson() => _$FichaNutricaoModelToJson(this);

  Map<String, dynamic> _$FichaNutricaoModelToJson(FichaNutricaoModel fn){
    return{
      "codigo" : fn.codigo,
      "idadmission" : fn.idadmission,
      "datacad" : fn.datacad,
      "datainicio" : fn.datainicio,
      "datafim" : fn.datafim,
      "professional" : fn.idprofessional,
      "idespecialidade" : fn.idespecialidade,
      "idprofagenda" : fn.idprofagenda,
      "assinatura_pac" : fn.assinatura_pac,
      "assinatura_prof" : fn.assinatura_prof,
      "acompanhante" : fn.acompanhante,
      "grupohas" : fn.grupohas,
      "grupodiabetes" : fn.grupodiabetes,
      "grupodislipidemia" : fn.grupodislipidemia,
      "grupoimobilidade" : fn.grupoimobilidade,
      "grupoobesidade" : fn.grupoobesidade,
      "grupodesnutricao" : fn.grupodesnutricao,
      "grupooutros" : fn.grupooutros,
      "nutricao" : fn.nutricao,
      "nutricaotipoenteral" : fn.nutricaotipoenteral,
      "nutricaotipoenteraloutros" : fn.nutricaotipoenteraloutros,
      "dietaenteral" : fn.dietaenteral,
      "dietaenteralentupimento" : fn.dietaenteralentupimento,
      "dietaindustipo" : fn.dietaindustipo,
      "dietaindustmanipqtde" : fn.dietaindustmanipqtde,
      "dietaindustmanipdesc" : fn.dietaindustmanipdesc,
      "dietaindustprontaqtde" : fn.dietaindustprontaqtde,
      "dietaindustprontadesc" : fn.dietaindustprontadesc,
      "dietaindustprontafab" : fn.dietaindustprontafab,
      "dietaindustfornecedor" : fn.dietaindustfornecedor,
      "avalsubjingesta" : fn.avalsubjingesta,
      "avalsubjpesotipo" : fn.avalsubjpesotipo,
      "avalsubjpesoqtde" : fn.avalsubjpesoqtde,
      "avalsubjpesotempo" : fn.avalsubjpesotempo,
      "avalsubjsintomadiarreia" : fn.avalsubjsintomadiarreia,
      "avalsubjsintomahiporexia" : fn.avalsubjsintomahiporexia,
      "avalsubjsintomaconstipacao" : fn.avalsubjsintomaconstipacao,
      "avalsubjsintomaoutros" : fn.avalsubjsintomaoutros,
      "avalsubjritmointestinal" : fn.avalsubjritmointestinal,
      "avalantroaj" : fn.avalantroaj,
      "avalantropeso" : fn.avalantropeso,
      "avalantrocircabd" : fn.avalantrocircabd,
      "avalantroimc" : fn.avalantroimc,
      "avalantrocp" : fn.avalantrocp,
      "avalantroidade" : fn.avalantroidade,
      "avalantrodct" : fn.avalantrodct,
      "avalantrocb" : fn.avalantrocb,
      "avalantrocmb" : fn.avalantrocmb,
      "avalantroaltura" : fn.avalantroaltura,
      "diagnutriabaixo65" : fn.diagnutriabaixo65,
      "diagnutriacima65" : fn.diagnutriacima65,
      "diagnutridesc" : fn.diagnutridesc,
      "conduta" : fn.conduta,
      "latitude" : fn.latitude,
      "longitude" : fn.longitude,
      "offline" : fn.offline,
    };
  }

}