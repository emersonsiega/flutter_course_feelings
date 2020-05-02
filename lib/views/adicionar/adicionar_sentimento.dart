import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/blocs/novo_sentimento_bloc.dart';
import 'package:flutter_course_feelings/blocs/sentimentos_bloc.dart';
import 'package:flutter_course_feelings/model/sentimento.dart';
import 'package:flutter_course_feelings/views/adicionar/pages/pensamentos_page.dart';
import 'package:flutter_course_feelings/views/adicionar/pages/tipo_sentimento_page.dart';

class AdicionarSentimento extends StatefulWidget {
  @override
  _AdicionarSentimentoState createState() => _AdicionarSentimentoState();
}

class _AdicionarSentimentoState extends State<AdicionarSentimento> {
  PageController _controller;
  bool _firstPage;

  @override
  void initState() {
    super.initState();
    _firstPage = true;
    _controller = PageController(initialPage: 0, keepPage: true);
    _controller.addListener(_onChangePage);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onChangePage);
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
            TipoSentimentoPage(),
            PensamentosPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onSave,
          child: _firstPage ? Icon(Icons.fast_forward) : Icon(Icons.check),
        ),
      ),
    );
  }

  void _onSave() {
    if (_firstPage) {
      _controller.nextPage(
        duration: Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    } else {
      final novoSentimentoBloc = BlocProvider.getBloc<NovoSentimentoBloc>();
      Sentimento sentimento = novoSentimentoBloc.getSentimento();

      if (sentimento.pensamentos != null && sentimento.pensamentos.isNotEmpty) {
        final sentimentosBloc = BlocProvider.getBloc<SentimentosBloc>();
        sentimentosBloc.addSentimento(sentimento);

        Navigator.of(context).pop();
      }
    }
  }
}
