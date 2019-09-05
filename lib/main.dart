import 'package:flutter/material.dart';
import 'package:flutter_course_feelings/views/sentimentos_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentimentos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff54778F),
        accentColor: Color(0xff8BBDE2),
      ),
      home: SentimentosView(),
    );
  }
}
