import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/blocs/novo_sentimento_bloc.dart';

class PensamentosPage extends StatefulWidget {
  @override
  _PensamentosPageState createState() => _PensamentosPageState();
}

class _PensamentosPageState extends State<PensamentosPage> {
  final _novoSentimentoBloc = BlocProvider.getBloc<NovoSentimentoBloc>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pensamentos",
              ),
              onChanged: (text) {
                _novoSentimentoBloc.addPensamentos(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
