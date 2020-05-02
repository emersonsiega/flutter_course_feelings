import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:rxdart/subjects.dart';

class SentimentosBloc extends BlocBase {
  List<Sentimento> _sentimentos = [];

  final _sentimentosController = BehaviorSubject<List<Sentimento>>();

  void addSentimento(Sentimento sentimento) {
    _sentimentos.add(sentimento);
    _sentimentosController.sink.add(_sentimentos);
  }

  void removeSentimentos() {
    _sentimentos = [];
    _sentimentosController.sink.add(_sentimentos);
  }

  Stream<List<Sentimento>> sentimentosStream() {
    return _sentimentosController.stream;
  }

  @override
  void dispose() {
    super.dispose();

    _sentimentosController.close();
  }
}
