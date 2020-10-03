class VisitasRealizadasModel {
  int admissao;
  String nmpaciente;
  String dataini;
  String datafim;
  int idtemplate;
  String nmtemplate;
  String nmprofessional;
  int idevolucao;

  VisitasRealizadasModel(
      {this.admissao,
        this.nmpaciente,
        this.dataini,
        this.datafim,
        this.idtemplate,
        this.nmtemplate,
        this.nmprofessional,
        this.idevolucao});

  VisitasRealizadasModel.fromJson(Map<String, dynamic> json) {
    admissao = json['admissao'];
    nmpaciente = json['nmpaciente'];
    dataini = json['dataini'];
    datafim = json['datafim'];
    idtemplate = json['idtemplate'];
    nmtemplate = json['nmtemplate'];
    nmprofessional = json['nmprofessional'];
    idevolucao = json['idevolucao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admissao'] = this.admissao;
    data['nmpaciente'] = this.nmpaciente;
    data['dataini'] = this.dataini;
    data['datafim'] = this.datafim;
    data['idtemplate'] = this.idtemplate;
    data['nmtemplate'] = this.nmtemplate;
    data['nmprofessional'] = this.nmprofessional;
    data['idevolucao'] = this.idevolucao;
    return data;
  }
}