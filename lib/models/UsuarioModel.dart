class UsuarioModel{

  int codigo;
  int idperson;
  String nome;
  String login;
  String email;
  int especialidade;
  String apelido;
  String nmespecialidade;
  String senha;
  String primeiroacesso;

  UsuarioModel(
      {this.codigo,
        this.idperson,
        this.nome,
        this.login,
        this.email,
        this.especialidade,
        this.apelido,
        this.nmespecialidade,
        this.senha,
        this.primeiroacesso});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    idperson = json['idperson'];
    nome = json['nome'];
    login = json['login'];
    email = json['email'];
    especialidade = json['especialidade'];
    apelido = json['apelido'];
    nmespecialidade = json['nmespecialidade'];
    senha = json['senha'];
    primeiroacesso = json['primeiroacesso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['idperson'] = this.idperson;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['email'] = this.email;
    data['especialidade'] = this.especialidade;
    data['apelido'] = this.apelido;
    data['nmespecialidade'] = this.nmespecialidade;
    data['senha'] = this.senha;
    data['primeiroacesso'] = this.primeiroacesso;
    return data;
  }

}