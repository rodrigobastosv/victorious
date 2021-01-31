import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/widget/footer.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSTitle('Quem somos'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      texto,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
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
