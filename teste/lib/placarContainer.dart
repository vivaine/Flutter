import 'package:flutter/material.dart';
import 'package:teste/components/ResultadoJogo.dart';
import 'package:teste/components/placarJogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<ResultadoJogo> resultados = [
    new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
    new ResultadoJogo("Palmeiras", "Corinthians", "0", "10"),
    new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            PlacarJogo(new ResultadoJogo("Brasil", "Alemanha", "1", "7")),
            PlacarJogo(
                new ResultadoJogo("Palmeiras", "Corinthians", "10", "0")),
            PlacarJogo(new ResultadoJogo("Noroeste", "Palmeiras", "10", "0")),
          ],
        ),
      ),
    );
  }
}
