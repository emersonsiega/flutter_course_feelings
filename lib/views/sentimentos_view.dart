import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/blocs/sentimentos_bloc.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/widgets/sentimento_tile.dart';

class SentimentosView extends StatefulWidget {
  @override
  _SentimentosViewState createState() => _SentimentosViewState();
}

class _SentimentosViewState extends State<SentimentosView> {
  final bloc = BlocProvider.getBloc<SentimentosBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentimentos"),
      ),
      body: Container(
        child: StreamBuilder<List<Sentimento>>(
          stream: bloc.sentimentosStream(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text(
                  "Nenhum sentimento anotado",
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              children: snapshot.data
                  .map((sentimento) => SentimentoTile(
                        sentimento: sentimento,
                      ))
                  .toList(),
            );
          },
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
              onPressed: bloc.removeSentimentos,
            ),
          ],
        ),
      ),
    );
  }

  void _addSentimento() {
    Navigator.of(context).pushNamed("/novo");
  }
}
