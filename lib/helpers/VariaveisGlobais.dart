import 'package:sauderesidencedigital/models/AgendaModel.dart';
import 'package:sauderesidencedigital/models/FichaNutricaoModel.dart';
import 'package:sauderesidencedigital/models/FichaPsicologiaModel.dart';
import 'package:sauderesidencedigital/models/FichaTerapiaModel.dart';
import 'package:sauderesidencedigital/models/UsuarioModel.dart';

class VariaveisGlobais{
  static String linkBasico = 'http://35.199.34.23/SaudeResidenceWebService/srhcws';
  static String linkExterno = "http://200.150.138.34:8001/sauderesidence/intranet/";

  static UsuarioModel dadosUsuario;
  static AgendaModel dadosAgenda;
  static FichaTerapiaModel dadosFichaTerapia;
  static FichaNutricaoModel dadosFichaNutricao;
  static FichaPsicologiaModel dadosFichaPsicologia;

  static String tipoFicha;
  static String latitude;
  static String longitude;

  static String datainicial;
  static String datafinal;
}