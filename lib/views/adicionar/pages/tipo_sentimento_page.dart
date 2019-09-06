import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/model/tipo_sentimento.dart';

class TipoSentimentoPage extends StatefulWidget {
  final Function addTipoSentimento;

  TipoSentimentoPage({this.addTipoSentimento});

  @override
  _TipoSentimentoPageState createState() => _TipoSentimentoPageState();
}

class _TipoSentimentoPageState extends State<TipoSentimentoPage> {
  Sentimento _sentimento;
  double _slider;

  @override
  void initState() {
    super.initState();

    _slider = 0;
    _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
  }

  void _onChangeSlider(double value) {
    setState(() {
      _slider = value;
      _sentimento.tipoSentimento = TipoSentimento.values[value.round()];
      widget.addTipoSentimento(_sentimento.tipoSentimento);
    });
  }

  Color _getColor() {
    return Color.lerp(Colors.blue, Colors.red, _slider / 4);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
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
              _sentimento.emoji,
              style: TextStyle(fontSize: 90),
            ),
          ),
          Text(
            _sentimento.sentimento,
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
      ),
    );
  }
}
