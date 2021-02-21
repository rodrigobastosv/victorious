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
    final space = MediaQuery.of(context).size.width > 600 ? 32.0 : 0.0;
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
                  padding: EdgeInsets.symmetric(horizontal: space),
                  child: VSTitle('Quem somos'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: space+8.0),
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
