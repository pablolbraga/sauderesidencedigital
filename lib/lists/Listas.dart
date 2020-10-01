
class TipoNutricao {
  int id;
  String nome;

  TipoNutricao(this.id, this.nome);

  static List<TipoNutricao> getTipoNutricao() {
    return <TipoNutricao>[
      TipoNutricao(0, "Selecione"),
      TipoNutricao(1, "Oral"),
      TipoNutricao(2, "Enteral"),
      TipoNutricao(3, "Ambas"),
    ];
  }
}

class TipoNutricaoEnteral {
  int id;
  String nome;

  TipoNutricaoEnteral(this.id, this.nome);

  static List<TipoNutricaoEnteral> getTipoNutricaoEnteral() {
    return <TipoNutricaoEnteral>[
      TipoNutricaoEnteral(0, "Selecione"),
      TipoNutricaoEnteral(1, "SNE"),
      TipoNutricaoEnteral(2, "Gastrostomia"),
      TipoNutricaoEnteral(3, "Outros"),
    ];
  }
}

class TipoDietaEnteral {
  int id;
  String nome;

  TipoDietaEnteral(this.id, this.nome);

  static List<TipoDietaEnteral> getTipoDietaEnteral() {
    return <TipoDietaEnteral>[
      TipoDietaEnteral(0, "Selecione"), TipoDietaEnteral(1, "Artesanal"), TipoDietaEnteral(2, "Industrializada"), TipoDietaEnteral(3, "Ambos"),
    ];
  }
}

class TipoDietaIndustrializada {
  int id;
  String nome;

  TipoDietaIndustrializada(this.id, this.nome);

  static List<TipoDietaIndustrializada> getTipoDietaIndustrializada() {
    return <TipoDietaIndustrializada>[
      TipoDietaIndustrializada(0, "Selecione"), TipoDietaIndustrializada(1, "Manipulada em Domicilio"), TipoDietaIndustrializada(2, "Pronta"), TipoDietaIndustrializada(3, "Ambas"),
    ];
  }
}

class FornecedorDietaIndustrializada {
  int id;
  String nome;

  FornecedorDietaIndustrializada(this.id, this.nome);

  static List<FornecedorDietaIndustrializada>
  getFornecedorDietaIndustrializada() {
    return <FornecedorDietaIndustrializada>[
      FornecedorDietaIndustrializada(0, "Selecione"), FornecedorDietaIndustrializada(1, "Beneficiário"), FornecedorDietaIndustrializada(2, "Plano"), FornecedorDietaIndustrializada(3, "Ambos"),
    ];
  }
}

class AvalSubjetivaIngesta {
  int id;
  String nome;

  AvalSubjetivaIngesta(this.id, this.nome);

  static List<AvalSubjetivaIngesta> getAvalSubjetivaIngesta() {
    return <AvalSubjetivaIngesta>[
      AvalSubjetivaIngesta(0, "Selecione"), AvalSubjetivaIngesta(1, "Aumentada"), AvalSubjetivaIngesta(2, "Diminuída"), AvalSubjetivaIngesta(3, "Normal"),
    ];
  }
}

class AvalSubjetivaPeso {
  int id;
  String nome;

  AvalSubjetivaPeso(this.id, this.nome);

  static List<AvalSubjetivaPeso> getAvalSubjetivaPeso() {
    return <AvalSubjetivaPeso>[
      AvalSubjetivaPeso(0, "Selecione"), AvalSubjetivaPeso(1, "Perda de Peso"), AvalSubjetivaPeso(2, "Ganho de Peso"), AvalSubjetivaPeso(3, "Sem Alterações"),
    ];
  }
}

class DiagNutricionalAbaixo65 {
  int id;
  String nome;

  DiagNutricionalAbaixo65(this.id, this.nome);

  static List<DiagNutricionalAbaixo65> getDiagNutricionalAbaixo65() {
    return <DiagNutricionalAbaixo65>[
      DiagNutricionalAbaixo65(0, "Selecione"), DiagNutricionalAbaixo65(1, "Não Atribuído"), DiagNutricionalAbaixo65(2, "Baixo Peso"),
      DiagNutricionalAbaixo65(3, "Eutrofia"), DiagNutricionalAbaixo65(4, "Pré-Obesidade"), DiagNutricionalAbaixo65(5, "Obesidade I"),
      DiagNutricionalAbaixo65(6, "Obesidade II"), DiagNutricionalAbaixo65(7, "Obesidade III"),
    ];
  }
}

class DiagNutricionalAcima65 {
  int id;
  String nome;

  DiagNutricionalAcima65(this.id, this.nome);

  static List<DiagNutricionalAcima65> getDiagNutricionalAcima65() {
    return <DiagNutricionalAcima65>[
      DiagNutricionalAcima65(0, "Selecione"),
      DiagNutricionalAcima65(1, "Não Atribuído"),
      DiagNutricionalAcima65(2, "Baixo Peso"),
      DiagNutricionalAcima65(3, "Eutrofia"),
      DiagNutricionalAcima65(4, "Obesidade"),
    ];
  }
}