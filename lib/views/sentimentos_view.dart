import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/model/tipo_sentimento.dart';
import 'package:flutter_course_feelings/widgets/sentimento_tile.dart';

class SentimentosView extends StatelessWidget {
  final List<Sentimento> _sentimentos = [
    Sentimento(
      tipoSentimento: TipoSentimento.FELIZ,
      pensamentos: "Estou feliz porque...",
    ),
    Sentimento(
      tipoSentimento: TipoSentimento.INDIFERENTE,
      pensamentos: "Estou indiferente porque...",
    ),
    Sentimento(
      tipoSentimento: TipoSentimento.NORMAL,
      pensamentos: "Estou normal porque...",
    ),
    Sentimento(
      tipoSentimento: TipoSentimento.TRISTE,
      pensamentos: "Estou triste porque...",
    ),
    Sentimento(
      tipoSentimento: TipoSentimento.RAIVA,
      pensamentos: "Estou com raiva porque...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentimentos"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          children: _sentimentos
              .map((sentimento) => SentimentoTile(
                    sentimento: sentimento,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSentimento,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: _removeSentimento,
            ),
          ],
        ),
      ),
    );
  }

  void _addSentimento() {
    //Adicionar sentimentos...
  }

  void _removeSentimento() {
    //Remover sentimentos
  }
}
