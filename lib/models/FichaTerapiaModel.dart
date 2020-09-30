class FichaTerapiaModel {
  int idadmission;
  String datahoraini;
  String datahorafim;
  String participacaocliente;
  String execucaotecnicaproposta;
  String observacao;
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

  FichaTerapiaModel({
    this.idadmission,
    this.datahoraini,
    this.datahorafim,
    this.participacaocliente,
    this.execucaotecnicaproposta,
    this.observacao,
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
    this.offline
  });

  FichaTerapiaModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    datahoraini = json['datahoraini'];
    datahorafim = json['datahorafim'];
    participacaocliente = json['participacaocliente'];
    execucaotecnicaproposta = json['execucaotecnicaproposta'];
    observacao = json['observacao'];
    idprofissional = json['idprofissional'];
    idespecialidade = json['idespecialidade'];
    datacriacao = json['datacriacao'];
    nmprofissional = json['nmprofissional'];
    apelido = json['apelido'];
    nmespecialidade = json['nmespecialidade'];
    numeroregistro = json['numeroregistro'];
    assinaturaprofissional = json['assinaturaprofissional'];
    assinaturapaciente = json['assinaturapaciente'];
    idprofagenda = json['idprofagenda'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    offline = json['offline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idadmission'] = this.idadmission;
    data['datahoraini'] = this.datahoraini;
    data['datahorafim'] = this.datahorafim;
    data['participacaocliente'] = this.participacaocliente;
    data['execucaotecnicaproposta'] = this.execucaotecnicaproposta;
    data['observacao'] = this.observacao;
    data['idprofissional'] = this.idprofissional;
    data['idespecialidade'] = this.idespecialidade;
    data['datacriacao'] = this.datacriacao;
    data['nmprofissional'] = this.nmprofissional;
    data['apelido'] = this.apelido;
    data['nmespecialidade'] = this.nmespecialidade;
    data['numeroregistro'] = this.numeroregistro;
    data['assinaturaprofissional'] = this.assinaturaprofissional;
    data['assinaturapaciente'] = this.assinaturapaciente;
    data['idprofagenda'] = this.idprofagenda;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['offline'] = this.offline;
    return data;
  }
}
