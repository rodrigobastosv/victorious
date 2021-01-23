import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:victorious/page/shared/vs_title.dart';

import '../shared/vs_scaffold.dart';

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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 34, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VSTitle('QUEM SOMOS'),
                    SizedBox(height: 16),
                    Text(
                      texto,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
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
