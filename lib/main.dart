import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/blocs/novo_sentimento_bloc.dart';
import 'package:flutter_course_feelings/blocs/sentimentos_bloc.dart';
import 'package:flutter_course_feelings/views/adicionar/adicionar_sentimento.dart';
import 'package:flutter_course_feelings/views/sentimentos_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((_) => SentimentosBloc()),
        Bloc((_) => NovoSentimentoBloc()),
      ],
      child: MaterialApp(
        title: 'Sentimentos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff54778F),
          accentColor: Color(0xff8BBDE2),
        ),
        routes: {
          "/": (_) => SentimentosView(),
          "/novo": (_) => AdicionarSentimento(),
        },
      ),
    );
  }
}
