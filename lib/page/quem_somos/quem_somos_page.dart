import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:victorious/page/quem_somos/widget/quem_somos_item.dart';

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
    final space = MediaQuery.of(context).size.width > 768 ? 16.0 : 0.0;
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quem_somos').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs;
            final items = docs
                .map(
                  (item) => QuemSomosItem(
                    imagem: item.data()['imagem'],
                    titulo: item.data()['titulo'],
                    subtitulo: item.data()['subtitulo'],
                    descricao: item.data()['descricao'],
                    isFirst: item.id == '1',
                  ),
                )
                .toList();
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: space),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    VSTitle('Quem somos'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: space),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 48,
                        children: [...items],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
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
