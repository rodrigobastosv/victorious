import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/fighters.dart';
import '../../model/fighter_model.dart';
import '../shared/vs_scaffold.dart';
import 'widget/category_button.dart';
import 'widget/fighter_card.dart';
import 'widget/highlight_fighter_card.dart';

class FightersPage extends StatefulWidget {
  FightersPage({Key key}) : super(key: key);

  @override
  _FightersPageState createState() => _FightersPageState();
}

class _FightersPageState extends State<FightersPage> {
  List<String> labels = [
    'Todos',
    'Feminino',
    'Peso Galo',
    'Peso Pena',
    'Peso Leve',
  ];
  int selectedLabelIndex = 0;
  List<QueryDocumentSnapshot> docs;
  String query;

  @override
  void initState() {
    super.initState();
  }

  void _filterFighters(String query) {
    setState(() {
      this.query = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('lutadores').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs;
            return Column(
              children: [
                Container(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) =>
                          HighlightFighterCard(docs[i].data()),
                      itemCount: docs.length,
                    ),
                  ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Lutador',
                      prefixIcon: FaIcon(
                        FontAwesomeIcons.search,
                      ),
                    ),
                    onChanged: _filterFighters,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Column(
                    children: [
                      FlutterToggleTab(
                        width: 90,
                        borderRadius: 30,
                        height: 50,
                        initialIndex: selectedLabelIndex,
                        selectedBackgroundColors: [Colors.blue],
                        selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        unSelectedTextStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        labels: labels,
                        selectedLabelIndex: (index) {
                          setState(() {
                            selectedLabelIndex = index;
                          });
                        },
                      ),
                      SizedBox(height: 24),
                      _getFighters(docs),
                    ],
                  ),
                )
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

  Widget _getFighters(List<QueryDocumentSnapshot> docs) {
    var lutadores = selectedLabelIndex != 0
        ? docs
            .where(
                (doc) => doc.data()['categoria'] == labels[selectedLabelIndex])
            .toList()
        : docs;
    if (query != null && query.isNotEmpty) {
      lutadores = lutadores.where((lutador) {
        final nome = lutador.data()['nome'] as String;
        return nome.toUpperCase().contains(query.toUpperCase());
      }).toList();
    }
    return lutadores.isEmpty
        ? Center(
            child: Text('Nenhum lutador encontrado!'),
          )
        : Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (_, i) => FighterCard(lutadores[i]),
              itemCount: lutadores.length,
            ),
          );
  }
}
