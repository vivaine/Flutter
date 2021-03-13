import 'package:agenda_flutter/contactCard.dart';
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
  void _openViewContact(Contact contact, int index) async {
    final resultContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactViewPage(
                new Contact(contact.name, contact.phoneNumber, contact.id),
                1)));
    if (resultContact != null) {
      _contacts[index].name = resultContact.name;
      _contacts[index].phoneNumber = resultContact.phoneNumber;
    } else {
      _contacts.removeAt(index);
    }
    setState(() {});
  }

  _openAddContact(BuildContext context) async {
    final resultContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactEditingPage(null, 0)));
    if (resultContact != null) {
      _contacts.add(resultContact);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final Contact item = _contacts[index];
          return Dismissible(
            key: Key(item.name),
            child: InkWell(
                onTap: () {
                  _openViewContact(_contacts[index], index);
                },
                child: new Card(
                    child: ContactCard(new Contact(
                        _contacts[index].name, _contacts[index].phoneNumber)))),
            onDismissed: (direction) {
              setState(() {
                _contacts.removeAt(index);
              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Contato apagado")));
            },
            background: Container(color: Colors.blue[300]),
            secondaryBackground: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    Text('Apagar', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
