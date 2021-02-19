import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../shared/vs_loading.dart';
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
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: VSTitle('Quem somos'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Html(data: texto),
                  ),
                ),
              ],
            );
          } else {
            return VSLoading();
          }
        },
      ),
    );
  }
}
