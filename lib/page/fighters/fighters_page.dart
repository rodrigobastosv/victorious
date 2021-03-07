import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';
import 'widget/fighter_card.dart';

class FightersPage extends StatefulWidget {
  FightersPage({Key key}) : super(key: key);

  @override
  _FightersPageState createState() => _FightersPageState();
}

class _FightersPageState extends State<FightersPage> {
  List<String> labels = [
    'Destaques',
    'Peso Mosca',
    'Peso Palha',
    'Peso Galo',
    'Peso Pena',
    'Peso Leve',
    'Todos',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSTitle('Lutadores'),
                _buildSearch(),
                SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildFighters(docs),
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

  Widget _buildSearch() {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1000),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Buscar Lutador',
            prefixIcon: Center(
              widthFactor: 2,
              child: FaIcon(
                FontAwesomeIcons.search,
              ),
            ),
          ),
          onChanged: _filterFighters,
        ),
      ),
    );
  }

  Widget _buildFighters(List<QueryDocumentSnapshot> docs) {
    return Column(
      children: [
        FlutterToggleTab(
          borderRadius: 0,
          width: MediaQuery.of(context).size.width > 600 ? 80 : 180,
          height: 40,
          initialIndex: selectedLabelIndex,
          selectedTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          unSelectedTextStyle: TextStyle(
            fontSize: 13,
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
    );
  }

  Widget _getFighters(List<QueryDocumentSnapshot> docs) {
    var lutadores = selectedLabelIndex == 0
        ? docs.where((doc) => doc.data()['destaque'] == true).toList()
        : selectedLabelIndex == labels.length - 1
            ? docs
            : docs
                .where((doc) =>
                    doc.data()['categoria'] == labels[selectedLabelIndex])
                .toList();
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
                childAspectRatio: MediaQuery.of(context).size.width > 1240
                    ? 2.4
                    : MediaQuery.of(context).size.width > 900
                        ? 2.4
                        : MediaQuery.of(context).size.width > 767
                            ? 1.8
                            : MediaQuery.of(context).size.width > 600
                                ? 3
                                : MediaQuery.of(context).size.width > 475
                                    ? 2
                                    : MediaQuery.of(context).size.width > 320
                                        ? 1.1
                                        : 0.9,
                crossAxisCount: MediaQuery.of(context).size.width > 2100
                    ? 5
                    : MediaQuery.of(context).size.width > 1600
                        ? 4
                        : MediaQuery.of(context).size.width > 1240
                            ? 3
                            : MediaQuery.of(context).size.width >= 768
                                ? 2
                                : 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (_, i) => FighterCard(lutadores[i]),
              itemCount: lutadores.length,
            ),
          );
  }
}
