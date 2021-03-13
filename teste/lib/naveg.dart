import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: PrimeiraRota(),
  ));
}

class PrimeiraRota extends StatelessWidget {
  final alcoolController = TextEditingController();
  final gasolinaController = TextEditingController();
  double resultado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              TextField(
                  controller: alcoolController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Álcool')),
            ],
          ),
          RaisedButton(
            child: Text('Calcular'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SegundaRota(resultado)),
              );
            },
          ),
        ],
      )),
    );
  }
}

class SegundaRota extends StatelessWidget {
  double resultado;

  SegundaRota(this.resultado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
}
