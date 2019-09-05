import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';

class SentimentoTile extends StatelessWidget {
  final Sentimento sentimento;

  const SentimentoTile({this.sentimento});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sentimento.sentimento),
      subtitle: Text(sentimento.pensamentos),
      isThreeLine: true,
      leading: Text(
        sentimento.emoji,
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
