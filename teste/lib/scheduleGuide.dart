import 'package:teste/components/PlacarJogo.dart';
import 'package:teste/components/ResultadoJogo.dart';
import 'package:flutter/material.dart';

List<ResultadoJogo> _resultados = [
  new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
  new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
];

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
  final title = 'Basic List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CadastroView()));
                print(_resultados.length);
                setState(() {});
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _resultados.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultadoView(_resultados[index])),
                  );
                },
                child: new Card(
                  child: PlacarJogo(new ResultadoJogo(
                      _resultados[index].adversario1,
                      _resultados[index].adversario2,
                      _resultados[index].resultado1,
                      _resultados[index].resultado2)),
                ));
          },
        ),
      ),
    );
  }
}

class ResultadoView extends StatelessWidget {
  final ResultadoJogo _resultadoJogo;

  ResultadoView(this._resultadoJogo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: Column(
          children: [
            PlacarJogo(this._resultadoJogo),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
          ],
        ),
      ),
    );
  }
}

class CadastroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Novo Placar"),
            onPressed: () {
              var novoResultado =
                  new ResultadoJogo("Dinamarca", "Bolivia", "0", "15");
              _resultados.add(novoResultado);

              Navigator.of(context).pop();
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            splashColor: Colors.grey,
          ),
        ));

    // Passo 1: Capturar os dados digitados nos campos
    // Passo 2: Inclurir um novo objeto na Lista
    // Passo 3: Voltar para a lista
    //  Navigator.of(context).pop();
    // Passo 4: ao retornar a lista, atualizar o estado do componente
    // setState(() {});
  }
}
