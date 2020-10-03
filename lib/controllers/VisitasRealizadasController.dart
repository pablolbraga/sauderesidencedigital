import 'package:sauderesidencedigital/helpers/VariaveisGlobais.dart';
import 'package:http/http.dart' as http;

class VisitasRealizadasController{

  static Future listarVisitasRealizadasPorPeriodo(int idperson, String dataini, datafim) async{

    var url = VariaveisGlobais.linkBasico + "/ListarVisitasRealizadasPorProfissionalPorPeriodo/" + idperson.toString() + "/" + dataini + "/" + datafim;
    return await http.get(url);

  }

}