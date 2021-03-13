import 'package:flutter/material.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo Combustível',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalcPage(title: 'Cálculo'),
    );
  }
}

class CalcPage extends StatefulWidget {
  CalcPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String resultado = " flutter";
  final alcoolController = TextEditingController();
  final gasolinaController = TextEditingController();
  double gasolina = 0;
  double alcool = 0;
  double valor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Combustível')),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                      controller: alcoolController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          hintText: 'Álcool')),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                      controller: gasolinaController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          hintText: 'Gasolina')),
                ),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff01A0C7),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
                          // setState(() {
                          gasolina =
                              double.tryParse(gasolinaController.text) ?? 0.0;
                          alcool =
                              double.tryParse(alcoolController.text) ?? 0.0;
                          if (alcool > 0.0 && gasolina > 0.0) {
                            valor = alcool / gasolina;
                            if (valor > 0.7)
                              resultado = 'Gasolina compensa';
                            else
                              resultado = 'Álcool compensa';
                          } else
                            resultado = 'Não foi possível calcular';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(resultado)));
                        },
                        child: Text("Calcular",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    )),
              ],
            )));
  }
}

class ResultPage extends StatelessWidget {
  String resultado;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  ResultPage(this.resultado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(resultado,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29))),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xff01A0C7),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Novo cálculo',
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )),
          )
        ],
      )),
    );
  }
}
