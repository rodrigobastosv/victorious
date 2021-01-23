import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:victorious/page/shared/vs_scaffold.dart';

class QuemSomosPage extends StatefulWidget {
  QuemSomosPage({Key key}) : super(key: key);

  @override
  _QuemSomosPageState createState() => _QuemSomosPageState();
}

class _QuemSomosPageState extends State<QuemSomosPage> {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quem_somos').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs;
            final texto = docs[0]['texto'];
            return Center(
              child: Text(texto),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
