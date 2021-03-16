import 'package:agenda_flutter/contactCard.dart';
import 'package:agenda_flutter/repository/ScheduleRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:agenda_flutter/contactViewPage.dart';
import 'package:agenda_flutter/components/contact.dart';
//import 'package:agenda_flutter/contactCard.dart';
import 'package:agenda_flutter/contactEditingPage.dart';

List<Contact> _contacts = [
  new Contact("Mercedes Morcerf", 554412345678, 1),
  new Contact("Edmond Dantès", 554433224455, 2)
];

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScheduleHomePage(title: 'Agenda'),
    );
  }
}

class ScheduleHomePage extends StatefulWidget {
  ScheduleHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleHomePage createState() => _ScheduleHomePage();
}

class _ScheduleHomePage extends State<ScheduleHomePage> {
  _openEditContact(BuildContext context, Contact contact) async {
    final resultContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactEditingPage(contact, 1)));
    if (resultContact != null) {
      contact.name = resultContact.name;
      contact.phoneNumber = resultContact.phoneNumber;
    }
    setState(() {});
  }

  void _openViewContact(Contact contact, int index) async {
    final resultContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactViewPage(contact, 1)));
    if (resultContact != null) {
      _contacts[index].name = resultContact.name;
      _contacts[index].phoneNumber = resultContact.phoneNumber;
      ScheduleRepository.update(resultContact);
    }
    setState(() {});
  }

  _openAddContact(BuildContext context) async {
    final resultContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactEditingPage(null, 0)));
    if (resultContact != null) {
      _contacts.add(resultContact);
      ScheduleRepository.save(resultContact);
      setState(() {});
    }
  }

  _treatDismiss(DismissDirection direction, Contact contact) {
    if (direction == DismissDirection.startToEnd) {
      setState(() {
        // _openEditContact(context, _contacts[index]);
      });
    } else if (direction == DismissDirection.endToStart) {
      setState(() {
        ScheduleRepository.delete(contact);
      });
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Contato apagado")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder(
        future: ScheduleRepository.list(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Center(child: Text('Lista vazia'));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Contact item = snapshot.data[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
                    child: InkWell(
                        onTap: () {
                          _openViewContact(item, index);
                        },
                        child: new Card(child: ContactCard(item))),
                    onDismissed: (direction) {
                      _treatDismiss(direction, item);
                    },
                    background: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.edit, color: Colors.white),
                                Text('Editar',
                                    style: TextStyle(color: Colors.white))
                              ]),
                        )),
                    secondaryBackground: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                              Text('Apagar',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )),
                  );
                });
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddContact(context);
        },
        tooltip: 'Incluir contato',
        child: Icon(Icons.add),
      ),
    );
  }
}
