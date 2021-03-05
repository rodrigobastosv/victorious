import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';
import 'widget/contact_card.dart';
import 'widget/contact_form.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('contato').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contato = snapshot.data.docs[0];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VSTitle('Contato'),
                  Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    children: [
                      ContactCard(contato),
                      ContactForm(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return VSLoading();
          }
        },
      ),
    );
  }
}
