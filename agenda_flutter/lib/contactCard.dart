import 'package:agenda_flutter/components/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(this.contact.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text(this.contact.phoneNumber.toString())
          ],
        ));
  }
}
