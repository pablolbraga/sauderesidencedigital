import 'package:http/http.dart' as http;
import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';

class AgendaController{

  static Future listarAgendaProfissional(int idperson) async{
    var url = VariaveisGlobais.linkBasico + "/ListarAgendaPorProfissional/" + idperson.toString();
    return await http.get(url);
  }

}