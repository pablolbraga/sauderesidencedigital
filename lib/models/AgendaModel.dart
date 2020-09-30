class AgendaModel {
  int codigo;
  int idadmission;
  String nmpaciente;
  int codconvenio;
  String nmconvenio;
  int idade;
  int idprofagenda;
  int idprofessional;
  String nmprofessional;
  int codusuario;
  String dataprogini;
  String dataprogfim;
  String endereco;
  String apelidoprofissional;
  String registroprofissional;

  AgendaModel(
      {this.codigo,
        this.idadmission,
        this.nmpaciente,
        this.codconvenio,
        this.nmconvenio,
        this.idade,
        this.idprofagenda,
        this.idprofessional,
        this.nmprofessional,
        this.codusuario,
        this.dataprogini,
        this.dataprogfim,
        this.endereco,
        this.apelidoprofissional,
        this.registroprofissional});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    idadmission = json['idadmission'];
    nmpaciente = json['nmpaciente'];
    codconvenio = json['codconvenio'];
    nmconvenio = json['nmconvenio'];
    idade = json['idade'];
    idprofagenda = json['idprofagenda'];
    idprofessional = json['idprofessional'];
    nmprofessional = json['nmprofessional'];
    codusuario = json['codusuario'];
    dataprogini = json['dataprogini'];
    dataprogfim = json['dataprogfim'];
    endereco = json['endereco'];
    apelidoprofissional = json['apelidoprofissional'];
    registroprofissional = json['registroprofissional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['idadmission'] = this.idadmission;
    data['nmpaciente'] = this.nmpaciente;
    data['codconvenio'] = this.codconvenio;
    data['nmconvenio'] = this.nmconvenio;
    data['idade'] = this.idade;
    data['idprofagenda'] = this.idprofagenda;
    data['idprofessional'] = this.idprofessional;
    data['nmprofessional'] = this.nmprofessional;
    data['codusuario'] = this.codusuario;
    data['dataprogini'] = this.dataprogini;
    data['dataprogfim'] = this.dataprogfim;
    data['endereco'] = this.endereco;
    data['apelidoprofissional'] = this.apelidoprofissional;
    data['registroprofissional'] = this.registroprofissional;
    return data;
  }
}
