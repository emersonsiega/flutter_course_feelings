import 'package:flutter_course_feelings/model/tipo_sentimento.dart';

class Sentimento {
  TipoSentimento tipoSentimento;
  String pensamentos;

  Sentimento({this.tipoSentimento, this.pensamentos});

  String get sentimento {
    switch (tipoSentimento) {
      case TipoSentimento.FELIZ:
        return "Feliz";
      case TipoSentimento.NORMAL:
        return "Normal";
      case TipoSentimento.INDIFERENTE:
        return "Indiferente";
      case TipoSentimento.TRISTE:
        return "Triste";
      case TipoSentimento.RAIVA:
        return "Raiva";
      default:
        return "";
    }
  }

  String get emoji {
    switch (tipoSentimento) {
      case TipoSentimento.FELIZ:
        return "😄";
      case TipoSentimento.NORMAL:
        return "🙂";
      case TipoSentimento.INDIFERENTE:
        return "😐";
      case TipoSentimento.TRISTE:
        return "🙁";
      case TipoSentimento.RAIVA:
        return "😠";
      default:
        return "😶";
    }
  }
}
