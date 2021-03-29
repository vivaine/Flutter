import 'package:teste/components/PlacarJogo.dart';
import 'package:teste/components/ResultadoJogo.dart';
import 'package:teste/repository/PlacarRepository.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  final ResultadoJogo resultado;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final pais1 = TextEditingController();
  final placar1 = TextEditingController();
  final pais2 = TextEditingController();
  final placar2 = TextEditingController();

  CadastroView(this.resultado);

  @override
  Widget build(BuildContext context) {
    pais1.text = resultado.adversario1;
    placar1.text = resultado.resultado1;
    pais2.text = resultado.adversario2;
    placar2.text = resultado.resultado2;

    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: pais1,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "País",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: placar1,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Placar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: pais2,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "País",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: placar2,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Placar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              RaisedButton(
                child: Text("Novo Placar"),
                onPressed: () {
                  var novoResultado = new ResultadoJogo(
                      pais1.text, pais2.text, placar1.text, placar2.text);
                  resultado.adversario1 = pais1.text;
                  resultado.adversario2 = pais2.text;
                  resultado.resultado1 = placar1.text;
                  resultado.resultado2 = placar2.text;
                  if (resultado.id == null) {
                    PlacarRepository.save(resultado);
                  } else {
                    PlacarRepository.update(resultado);
                  }

                  Navigator.of(context).pop();
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
