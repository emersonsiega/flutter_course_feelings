import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/blocs/novo_sentimento_bloc.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/model/tipo_sentimento.dart';

class TipoSentimentoPage extends StatefulWidget {
  @override
  _TipoSentimentoPageState createState() => _TipoSentimentoPageState();
}

class _TipoSentimentoPageState extends State<TipoSentimentoPage> {
  double _slider;
  final _novoSentimentoBloc = BlocProvider.getBloc<NovoSentimentoBloc>();

  @override
  void initState() {
    super.initState();
    _novoSentimentoBloc.clear();
    _slider = 0;
  }

  void _onChangeSlider(double value) {
    setState(() {
      _slider = value;

      _novoSentimentoBloc
          .addTipoSentimento(TipoSentimento.values[value.round()]);
    });
  }

  Color _getColor() {
    return Color.lerp(Colors.blue, Colors.red, _slider / 4);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<Sentimento>(
        stream: _novoSentimentoBloc.novoSentimentoStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Como está se sentindo agora?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  snapshot.data.emoji,
                  style: TextStyle(fontSize: 90),
                ),
              ),
              Text(
                snapshot.data.sentimento,
                style: Theme.of(context).textTheme.display2.copyWith(
                      color: _getColor(),
                    ),
              ),
              Slider(
                value: _slider,
                activeColor: _getColor(),
                onChanged: _onChangeSlider,
                min: 0,
                max: 4,
              )
            ],
          );
        },
      ),
    );
  }
}
