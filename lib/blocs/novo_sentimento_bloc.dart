import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/model/tipo_sentimento.dart';
import 'package:rxdart/subjects.dart';

class NovoSentimentoBloc extends BlocBase {
  Sentimento _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
  final _sentimentoController = BehaviorSubject<Sentimento>.seeded(
    Sentimento(tipoSentimento: TipoSentimento.FELIZ),
  );

  Stream<Sentimento> novoSentimentoStream() {
    return _sentimentoController.stream;
  }

  Sentimento getSentimento() {
    return _sentimentoController.stream.value;
  }

  void addTipoSentimento(TipoSentimento tipo) {
    _sentimento.tipoSentimento = tipo;
    _sentimentoController.sink.add(_sentimento);
  }

  void addPensamentos(String text) {
    _sentimento.pensamentos = text;
    _sentimentoController.sink.add(_sentimento);
  }

  void clear() {
    _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
    _sentimentoController.sink.add(_sentimento);
  }

  @override
  void dispose() {
    super.dispose();

    _sentimentoController.close();
  }
}
