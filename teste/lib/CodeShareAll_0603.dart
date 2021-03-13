// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Basic List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.map),
//               title: Text('Map'),
//             ),
//             ListTile(
//               leading: Icon(Icons.photo_album),
//               title: Text('Album'),
//             ),
//             ListTile(
//               leading: Icon(Icons.phone),
//               title: Text('Phone'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ----

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Basic List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Container(
//               height: 100,
//               padding: EdgeInsets.all(20.0),
//               color: Colors.red,
//               child: Text("ola lista"),
//             ),
//             Container(
//               height: 100,
//               color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ----

//   import 'package:flutter/material.dart';

// class PlacarJogo extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       alignment: Alignment.center,
//       child: Center(
//         child: Row(
//             //geral
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                   //bandeira
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: 2.0),
//                       child: Image.asset(
//                         'assets/images/brazil.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     )
//                   ]),
//               Column(
//                 //Brasil
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Text('Brasil',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 30)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text('01',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 70)),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Column(
//                 //X
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.only(top: 10, left: 3.0, right: 3.0),
//                       child: Text('X',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 60)))
//                 ],
//               ),
//               Column(
//                   //Alemanha
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text('Alemanha',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 25)),
//                     Text('07',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 70)),
//                   ]),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 3.1),
//                     child: Image.asset(
//                       'assets/images/germany.png',
//                       height: 35,
//                       width: 35,
//                     ),
//                   )
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }

// ---
// import 'package:base/components/PlacarJogo.dart';
// import 'package:base/components/ResultadoJogo.dart';
// import 'package:base/main5.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   List<ResultadoJogo> _resultados = [
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Basic List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView.builder(
//           itemCount: _resultados.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             ResultadoView(_resultados[index])),
//                   );
//                 },
//                 child: new Card(
//                   child: PlacarJogo(new ResultadoJogo(
//                       _resultados[index].adversario1,
//                       _resultados[index].adversario2,
//                       _resultados[index].resultado1,
//                       _resultados[index].resultado2)),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

// class ResultadoView extends StatelessWidget {
//   final ResultadoJogo _resultadoJogo;

//   ResultadoView(this._resultadoJogo);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Resultado"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             PlacarJogo(this._resultadoJogo),
//             Expanded(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: SingleChildScrollView(
//                         child: Text(
//                             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ----

// class ResultadoJogo {
//   String adversario1;
//   String adversario2;
//   String resultado1;
//   String resultado2;

//   ResultadoJogo(
//       this.adversario1, this.adversario2, this.resultado1, this.resultado2);
// }

// -----

//   import 'package:base/components/ResultadoJogo.dart';
// import 'package:flutter/material.dart';

// class PlacarJogo extends StatelessWidget {
//   final ResultadoJogo resultado;

//   PlacarJogo(this.resultado);

//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       alignment: Alignment.center,
//       child: Center(
//         child: Row(
//             //geral
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                   //bandeira
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: 2.0),
//                       child: Image.asset(
//                         'assets/images/brazil.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     )
//                   ]),
//               Column(
//                 //Brasil
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Text(this.resultado.adversario1,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(this.resultado.resultado1,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 40)),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Column(
//                 //X
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.only(top: 10, left: 3.0, right: 3.0),
//                       child: Text('X',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 40)))
//                 ],
//               ),
//               Column(
//                   //Alemanha
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(this.resultado.adversario2,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20)),
//                     Text(this.resultado.resultado2,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 40)),
//                   ]),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 3.1),
//                     child: Image.asset(
//                       'assets/images/germany.png',
//                       height: 35,
//                       width: 35,
//                     ),
//                   )
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }

// ---

//   import 'package:flutter/material.dart';

// void main() => runApp(_MyAppState());

// class _MyAppState extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter login UI',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Login'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//   String resultado = " flutter";
//   final emailControler = TextEditingController();
//   final passwordControler = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         body: Center(
//             child: Container(
//       child: Padding(
//         padding: const EdgeInsets.all(35.0),
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/images/apple.png',
//               height: 50,
//               width: 50,
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             TextField(
//               controller: emailControler,
//               obscureText: false,
//               style: style,
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
//                   hintText: "Email",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32.0))),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             TextField(
//               controller: passwordControler,
//               obscureText: true,
//               style: style,
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
//                   hintText: "Password",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32.0))),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Material(
//               elevation: 5.0,
//               borderRadius: BorderRadius.circular(30.0),
//               color: Color(0xff01A0C7),
//               child: MaterialButton(
//                 minWidth: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
//                 onPressed: () {
//                   setState(() {
//                     resultado =
//                         emailControler.text + " : " + passwordControler.text;
//                   });
//                 },
//                 child: Text("Login",
//                     textAlign: TextAlign.center,
//                     style: style.copyWith(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Text("ola $resultado")
//           ],
//         ),
//       ),
//     )));
//   }

//   double _calculoCombustivel(double alcool, double gasolina) {
//     return 0.0;
//   }
// }

// ------

//   import 'package:base/components/PlacarJogo.dart';
// import 'package:base/components/ResultadoJogo.dart';
// import 'package:base/main5.dart';
// import 'package:flutter/material.dart';

//   List<ResultadoJogo> _resultados = [
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//     new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//     new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
//     new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
//   ];

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Basic List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           actions: [
//             IconButton(
//               icon: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CadastroView()),
//                 );
//               },
//             )
//           ],
//         ),
//         body: ListView.builder(
//           itemCount: _resultados.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             ResultadoView(_resultados[index])),
//                             // setState(() {});
//                   );
//                 },
//                 child: new Card(
//                   child: PlacarJogo(new ResultadoJogo(
//                       _resultados[index].adversario1,
//                       _resultados[index].adversario2,
//                       _resultados[index].resultado1,
//                       _resultados[index].resultado2)),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

// class ResultadoView extends StatelessWidget {
//   final ResultadoJogo _resultadoJogo;

//   ResultadoView(this._resultadoJogo);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Resultado"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             PlacarJogo(this._resultadoJogo),
//             Expanded(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: SingleChildScrollView(
//                         child: Text(
//                             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CadastroView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Resultado"),
//         ),
//         body: Center(
//           child: Text("ola"),
//         ));

//         //  Navigator.of(context).pop();
//   }
// }

// ----

// import 'package:base/components/PlacarJogo.dart';
// import 'package:base/components/ResultadoJogo.dart';
// import 'package:flutter/material.dart';

// List<ResultadoJogo> _resultados = [
//   new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
//   new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
// ];

// void main() => runApp(MyList());

// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Placar Futebol',
//       home: _Lista(),
//     );
//   }
// }

// class _Lista extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<_Lista> {
//   final title = 'Basic List';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           actions: [
//             IconButton(
//               icon: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await Navigator.push(
//                     context,
//                     new MaterialPageRoute(
//                         builder: (context) => CadastroView()));
//                 print(_resultados.length);
//                 setState(() {});
//               },
//             )
//           ],
//         ),
//         body: ListView.builder(
//           itemCount: _resultados.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             ResultadoView(_resultados[index])),
//                   );
//                 },
//                 child: new Card(
//                   child: PlacarJogo(new ResultadoJogo(
//                       _resultados[index].adversario1,
//                       _resultados[index].adversario2,
//                       _resultados[index].resultado1,
//                       _resultados[index].resultado2)),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

// class ResultadoView extends StatelessWidget {
//   final ResultadoJogo _resultadoJogo;

//   ResultadoView(this._resultadoJogo);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Resultado"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             PlacarJogo(this._resultadoJogo),
//             Expanded(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: SingleChildScrollView(
//                         child: Text(
//                             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CadastroView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Resultado"),
//         ),
//         body: Center(
//           child: RaisedButton(
//             child: Text("Novo Placar"),
//             onPressed: () {
//               var novoResultado =
//                   new ResultadoJogo("Dinamarca", "Bolivia", "0", "15");
//               _resultados.add(novoResultado);

//               Navigator.of(context).pop();
//             },
//             color: Colors.red,
//             textColor: Colors.yellow,
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//             splashColor: Colors.grey,
//           ),
//         ));

//     // Passo 1: Capturar os dados digitados nos campos
//     // Passo 2: Inclurir um novo objeto na Lista
//     // Passo 3: Voltar para a lista
//     //  Navigator.of(context).pop();
//     // Passo 4: ao retornar a lista, atualizar o estado do componente
//     // setState(() {});
//   }
// }
