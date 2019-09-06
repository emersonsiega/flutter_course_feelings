import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/views/adicionar/adicionar_sentimento.dart';
import 'package:flutter_course_feelings/widgets/sentimento_tile.dart';

class SentimentosView extends StatefulWidget {
  @override
  _SentimentosViewState createState() => _SentimentosViewState();
}

class _SentimentosViewState extends State<SentimentosView> {
  List<Sentimento> _sentimentos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentimentos"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          children: _sentimentos.isEmpty
              ? [
                  Text(
                    "Nenhum sentimento anotado",
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  )
                ]
              : _sentimentos
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

  void _insertSentimento(Sentimento sentimento) {
    setState(() {
      _sentimentos.add(sentimento);
    });
  }

  void _addSentimento() {
    //Chama página para criar um Sentimento e envia o método de adicionar sentimentos...
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AdicionarSentimento(
          addSentimento: _insertSentimento,
        ),
      ),
    );
  }

  void _removeSentimento() {
    setState(() {
      _sentimentos = [];
    });
  }
}
