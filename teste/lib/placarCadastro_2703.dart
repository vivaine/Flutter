import 'package:teste/components/PlacarJogo.dart';
import 'package:teste/components/ResultadoJogo.dart';
import 'package:teste/cadastroView.dart';
import 'package:teste/repository/PlacarRepository.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher'

void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar Futebol',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Jogos';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            CadastroView(ResultadoJogo.empty())));
                setState(() {});
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: PlacarRepository.list(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Center(child: Text('Lista vazia'));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: new Card(
                            child: PlacarJogo(snapshot.data[index]),
                          ),
                          onLongPress: () {
                            _showMenuOption(
                                context, index, snapshot.data[index]);
                          },
                        );
                      });
                }
              }),
        ),
      ),
    );
  }

  void _showMenuOption(
      BuildContext context, int index, ResultadoJogo resultado) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(10),
              height: 250,
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button(Icons.edit, context, () async {
                    Navigator.pop(context);
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroView(resultado)));
                    setState(() {});
                  }),
                  _button(Icons.delete, context, () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Atenção"),
                            content: Text("Deseja realmente excluir?"),
                            actions: <Widget>[
                              TextButton(
                                  child: Text('Sim'),
                                  onPressed: () {
                                    PlacarRepository.delete(resultado.id);
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  })
                            ],
                          );
                        });
                  }),
                  _button(Icons.close, context, () {
                    Navigator.pop(context);
                  })
                ],
              ));
        });
  }
}

Widget _button(IconData iconType, context, function) {
  return Padding(
      padding: EdgeInsets.all(20.0),
      child: FloatingActionButton(
        child: Icon(iconType),
        onPressed: function,
      ));
}
