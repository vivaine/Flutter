import 'dart:convert';
import 'package:teste/components/CardMoney.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}

double valorReal = 1;

Future<Map> getData() async {
  String request = "https://api.hgbrasil.com/finance?format=json&key=ea886132";
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final valorController = TextEditingController(text: valorReal.toString());

  final String fonte = 'Roboto';

  TextStyle style =
      TextStyle(fontFamily: 'Roboto', fontSize: 20.0, color: Colors.white);

  List _currencies = [
    'USD',
    'EUR',
    'GBP',
    'ARS',
    'CAD',
    'AUD',
    'JPY',
    'CNY',
    'BTC'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cotação de Moedas",
        home: Scaffold(
          appBar: AppBar(title: Text("Conversor de Moedas")),
          body: Container(
              color: Colors.blueGrey[900],
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      '  Valor R\$: ',
                      style: TextStyle(
                          fontFamily: fonte,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      controller: valorController,
                      textAlign: TextAlign.center,
                      style: style,
                    )),
                  ],
                ),
                ElevatedButton(
                  child: Text("Calcular"),
                  onPressed: () {
                    setState(() {
                      if (valorController.text.isNotEmpty) {
                        valorReal = double.parse(valorController.text);
                      } else {
                        valorReal = 1;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                    child: FutureBuilder<Map>(
                        future: getData(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Center(
                                child: Text("Esperando"),
                              );
                            case ConnectionState.waiting:
                              return Center(
                                  child: Text(
                                "Aguarde...",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 30.0),
                                textAlign: TextAlign.center,
                              ));
                            default:
                              if (snapshot.hasError) {
                                return Center(child: Text("error"));
                              } else {
                                return ListView.builder(
                                    itemCount: _currencies.length,
                                    itemBuilder: (context, index) {
                                      return new CardMoney(
                                          snapshot.data["results"]["currencies"]
                                              [_currencies[index]],
                                          valorReal);
                                    });
                              }
                          }
                        })),
              ])),
        ));
  }
}
