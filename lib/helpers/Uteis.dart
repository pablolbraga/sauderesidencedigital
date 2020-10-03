import 'dart:convert';

class Uteis{

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  static String formatarDataHora(String data){

    if (data.isEmpty){
      return "";
    } else {
      var dataHoraSeparada = data.split(" ");

      var xdata = dataHoraSeparada[0];
      var xhora = dataHoraSeparada[1];

      var diamesanoseparado = xdata.split("-");
      var dia = diamesanoseparado[2];
      var mes = diamesanoseparado[1];
      var ano = diamesanoseparado[0];

      return dia + "/" + mes + "/" + ano + " " + xhora;
    }
  }

  static String formatarData(String data){

    if (data.isEmpty){
      return "";
    } else {
      var dataHoraSeparada = data.split(" ");

      var xdata = dataHoraSeparada[0];
      var xhora = dataHoraSeparada[1];

      var diamesanoseparado = xdata.split("-");
      var dia = diamesanoseparado[2];
      var mes = diamesanoseparado[1];
      var ano = diamesanoseparado[0];

      return dia + "/" + mes + "/" + ano;
    }
  }

}