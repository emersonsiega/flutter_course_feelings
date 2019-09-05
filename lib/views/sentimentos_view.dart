import 'package:flutter/material.dart';

class SentimentosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentimentos"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          children: <Widget>[],
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
