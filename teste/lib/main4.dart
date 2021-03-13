import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Receitas'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/pavlova.jpg',
                height: 180,
                width: 180,
              ),
            ),
            Text('Pavlova',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'A pavlova é uma sobremesa feita de merengue e frutas. Dizem que foi criada como ' +
                      ' homenagem à bailarina russa Anna Pavlova. Porém há controvérsias na história, pois a Austrália ' +
                      'e Nova Zelândia reivindicam sua invenção, ' +
                      'cursus augue dictum vitae. Pellentesque in hendrerit tortor, a ' +
                      'semper ligula. Maecenas placerat vestibulum nisi ac laoreet. ' +
                      'Vestibulum arcu enim, placerat quis nibh eget, consectetur aliquam libero. Nulla facilisi. ' +
                      'Quisque faucibus in nisl in dictum. Vestibulum faucibus nec sapien at congue. Sed sit amet ' +
                      'metus molestie, tincidunt neque ac, mollis ante. Phasellus convallis libero quis nisi consectetur' +
                      ' luctus. Pellentesque dolor quam, malesuada id dui id, auctor maximus nulla.',
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.black),
                Icon(Icons.star, color: Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(Icons.kitchen, color: Colors.green[500]),
                        Text('PREP.'),
                        Text('25 min')
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(Icons.timer, color: Colors.green[500]),
                        Text('COOK:'),
                        Text('1 hr')
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(Icons.restaurant_outlined,
                            color: Colors.green[500]),
                        Text('FEEDS:'),
                        Text('4.6')
                      ],
                    )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
