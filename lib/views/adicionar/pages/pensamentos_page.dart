import 'package:flutter/material.dart';

class PensamentosPage extends StatefulWidget {
  final Function addDescricao;

  PensamentosPage({this.addDescricao});

  @override
  _PensamentosPageState createState() => _PensamentosPageState();
}

class _PensamentosPageState extends State<PensamentosPage> {
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
                widget.addDescricao(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
