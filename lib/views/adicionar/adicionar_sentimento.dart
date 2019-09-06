import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/model/tipo_sentimento.dart';
import 'package:flutter_course_feelings/views/adicionar/pages/pensamentos_page.dart';
import 'package:flutter_course_feelings/views/adicionar/pages/tipo_sentimento_page.dart';

class AdicionarSentimento extends StatefulWidget {
  final Function addSentimento;

  AdicionarSentimento({this.addSentimento});

  @override
  _AdicionarSentimentoState createState() => _AdicionarSentimentoState();
}

class _AdicionarSentimentoState extends State<AdicionarSentimento> {
  Sentimento _sentimento;
  PageController _controller;
  bool _firstPage;

  @override
  void initState() {
    super.initState();
    _firstPage = true;
    _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
    _controller = PageController(initialPage: 0, keepPage: true);
    _controller.addListener(_onChangePage);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onChangePage);
  }

  void _addTipoSentimento(TipoSentimento tipo) {
    setState(() {
      _sentimento.tipoSentimento = tipo;
    });
  }

  void _addPensamentos(String text) {
    setState(() {
      _sentimento.pensamentos = text;
    });
  }

  void _onChangePage() {
    setState(() {
      _firstPage = _controller.page == 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_firstPage) {
          return true;
        } else {
          _controller.previousPage(
            duration: Duration(milliseconds: 280),
            curve: Curves.easeInOut,
          );
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar"),
        ),
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            TipoSentimentoPage(
              addTipoSentimento: _addTipoSentimento,
            ),
            PensamentosPage(
              addDescricao: _addPensamentos,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_firstPage) {
              _controller.nextPage(
                duration: Duration(milliseconds: 280),
                curve: Curves.easeInOut,
              );
            } else {
              if (_sentimento.pensamentos.isNotEmpty) {
                widget.addSentimento(_sentimento);
                Navigator.of(context).pop();
              }
            }
          },
          child: _firstPage ? Icon(Icons.fast_forward) : Icon(Icons.check),
        ),
      ),
    );
  }
}
