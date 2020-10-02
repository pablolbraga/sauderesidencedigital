class FichaPsicologiaModel{
  int codigo;
  int idadmission;
  String datahoraini;
  String datahorafim;
  int idprofissional;
  int idespecialidade;
  String datacriacao;
  String nmprofissional;
  String apelido;
  String nmespecialidade;
  String numeroregistro;
  String assinaturaprofissional;
  String assinaturapaciente;
  int idprofagenda;
  String latitude;
  String longitude;
  String offline;
  String queixaprincipal;
  String queixacomeco;
  String queixarepentino;
  String queixatransformacao;
  String queixasintoma;

  FichaPsicologiaModel({
    this.codigo,
    this.idadmission,
    this.datahoraini,
    this.datahorafim,
    this.idprofissional,
    this.idespecialidade,
    this.datacriacao,
    this.nmprofissional,
    this.apelido,
    this.nmespecialidade,
    this.numeroregistro,
    this.assinaturaprofissional,
    this.assinaturapaciente,
    this.idprofagenda,
    this.latitude,
    this.longitude,
    this.offline,
    this.queixaprincipal,
    this.queixacomeco,
    this.queixarepentino,
    this.queixatransformacao,
    this.queixasintoma
  });

  Map<String, dynamic> toJson() => _$FichaPsicologiaModelToJson(this);

  Map<String, dynamic> _$FichaPsicologiaModelToJson(FichaPsicologiaModel ft){
    return{
      "codigo" : ft.codigo,
      "idadmission" : ft.idadmission,
      "datahoraini" : ft.datahoraini,
      "datahorafim" : ft.datahorafim,
      "idprofissional" : ft.idprofissional,
      "idespecialidade" : ft.idespecialidade,
      "datacriacao" : ft.datacriacao,
      "nmprofissional" : ft.nmprofissional,
      "apelido" : ft.apelido,
      "nmespecialidade" : ft.nmespecialidade,
      "numeroregistro" : ft.numeroregistro,
      "assinaturaprofissional" : ft.assinaturaprofissional,
      "assinaturapaciente" : ft.assinaturapaciente,
      "idprofagenda" : ft.idprofagenda,
      "latitude" : ft.latitude,
      "longitude" : ft.longitude,
      "offline" : ft.offline,
      "queixaprincipal" : ft.queixaprincipal,
      "queixacomeco" : ft.queixacomeco,
      "queixarepentino" : ft.queixarepentino,
      "queixatransformacao" : ft.queixatransformacao,
      "queixasintoma" : ft.queixasintoma
    };
  }
}