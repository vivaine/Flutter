import 'package:agenda_flutter/components/contact.dart';
import 'package:agenda_flutter/repository/ScheduleRepository.dart';
import 'package:flutter/material.dart';
import 'package:agenda_flutter/contactEditingPage.dart';

class ContactViewPage extends StatefulWidget {
  final Contact contact;
  final int mode;

  ContactViewPage(this.contact, this.mode);

  @override
  _ContactViewPage createState() => _ContactViewPage(this.contact);
}

class _ContactViewPage extends State<ContactViewPage> {
  final Contact contact;

  _ContactViewPage(this.contact);

  _openEditContact(BuildContext context) async {
    final resultContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactEditingPage(contact, 1)));
    if (resultContact != null) {
      contact.name = resultContact.name;
      contact.phoneNumber = resultContact.phoneNumber;
      ScheduleRepository.update(resultContact);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, contact);
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(contact.name,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(contact.phoneNumber.toString(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openEditContact(context);
        },
        tooltip: 'Editar contato',
        child: Icon(Icons.edit),
      ),
    );
  }
}
